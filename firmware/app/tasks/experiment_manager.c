/*
 * experiment_manager.c
 *
 * MIT License
 *
 * Copyright (c) 2020 André Mattos
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

/**
 * \brief Experiment Manager task implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.37
 * 
 * \date 09/05/2020
 * 
 * \addtogroup experiment_manager
 * \{
 */

#include <system/sys_log/sys_log.h>

#include <devices/latchup_monitors/latchup_monitors.h>
#include <devices/obc/obc.h>
#include <app/queues/queues.h>

#include "experiment_manager.h"

xTaskHandle xTaskExperimentManagerHandle;

/* Local functions prototypes */
int latchup_detection_routine(sys_state_package_t *sys_package);
int experiment_runner_routine(sys_state_package_t *sys_package, experiment_command_package_t *exp_package);

void vTaskExperimentManager(void *pvParameters)
{
    /* Delay before the first cycle */
    vTaskDelay(pdMS_TO_TICKS(TASK_EXPERIMENT_MANAGER_INITIAL_DELAY_MS));
    
    /* Create local queue OBC command package */
    obc_command_package_t obc_command = 
    {
        .operation_mode = DEFAULT_OPERATION_MODE,   
        .execution_config = DEFAULT_EXECUTION_CONFIG,
        .obc_sys_time = DEFAULT_OBC_SYS_TIME
    };

    /* Create local queue OBC data package */
    obc_data_package_t obc_data;

    /* Create local queue system state package */
    sys_state_package_t sys_state =
    {
        .time_stamp = DEFAULT_OBC_SYS_TIME,      
        .operation_mode = DEFAULT_OPERATION_MODE,   
        .execution_config = DEFAULT_EXECUTION_CONFIG,
        .error_count = 0,      
        .error_code = 0 
    };

    /* Create local queue experiment command package */
    experiment_command_package_t exp_command = 
    {
        .execution_config = DEFAULT_EXECUTION_CONFIG
    };

    /* Create local queue experiment state package */
    experiment_state_package_t exp_state;

    /* Create timeout value to start executing the experiment in case of any OBC command */
    uint32_t timeout_count;
    bool timeout_state = false;
    bool timeout_check = true;

    while(1)
    {
        TickType_t last_cycle = xTaskGetTickCount();


        if (xQueueReceive(xQueueOBCCommand, &obc_command, 0) == pdPASS) 
        {
            /* Succeed to receive the message, then update the system state variables */
            sys_state.time_stamp = obc_command.obc_sys_time;
            sys_state.operation_mode = obc_command.operation_mode;
            sys_state.execution_config = obc_command.execution_config;

            sys_log_print_event_from_module(SYS_LOG_INFO, TASK_EXPERIMENT_MANAGER_NAME, "Setting new OBC command package parameters: ");
            sys_log_new_line();
            sys_log_print_msg("time_stamp = ");
            sys_log_print_dec(sys_state.time_stamp);
            sys_log_new_line();
            sys_log_print_msg("operation_mode = ");
            sys_log_print_dec(sys_state.operation_mode);
            sys_log_new_line();
            sys_log_print_msg("execution_config = ");
            sys_log_print_dec(sys_state.execution_config);
            sys_log_new_line();
        }

        if(latchup_detection_routine(&sys_state) != 0)
        {
            /* Get system ticks, convert to milliseconds and add to system time stamp */
            sys_state.time_stamp += ((xTaskGetTickCount() / (uint32_t)configTICK_RATE_HZ) * 1000);
            
            /* Send system status if latch-up detected */
            xQueueSendToBack(xQueueSystemState, &sys_state, 0);
        }

        /* Get system ticks and convert to milliseconds */
        timeout_count = (xTaskGetTickCount() / (uint32_t)configTICK_RATE_HZ) * 1000;

        /* Logging routine to report OBC command reception timeout and the current execution parameters */
        if (timeout_check && (timeout_count >= (TASK_EXPERIMENT_RUNNER_INITIAL_DELAY_MS + EXPERIMENT_INIT_TIMEOUT_MS)))
        {
            sys_log_print_event_from_module(SYS_LOG_INFO, TASK_EXPERIMENT_RUNNER_NAME, "OBC interface timeout, running experiment with the parameters: ");
            sys_log_print_msg("time_stamp = ");
            sys_log_print_dec(timeout);
            sys_log_new_line();
            sys_log_print_msg("execution_config = ");
            sys_log_print_dec(exp_command.execution_config);
            sys_log_new_line();
            timeout_state = true;
            timeout_check = false;
        }

        if (experiment_runner_routine(&sys_state, &exp_command) || timeout_state)
        {
            /* Send the command to be executed in the experiment runner task */
            xQueueSendToBack(xQueueExperimentCommand, &exp_command, 0);  
            vTaskResume(xTaskExperimentRunnerHandle);
            sys_log_print_event_from_module(SYS_LOG_WARNING, TASK_EXPERIMENT_MANAGER_NAME, "Task resumed: ExperimentRunner");            
            timeout_state = false; 
        }

        if (xQueueReceive(xQueueExperimentState, &exp_state, 0) == pdPASS) 
        {
            //media_read(MEDIA_ESRAM, exp_state.address, (uint8_t *)&obc_data, exp_state.length);
            xQueueSendToBack(xQueueOBCData, &obc_data, 0);
        }
        
        /* Restore the system state variable error code for the next cycle */            
        sys_state.error_code = 0;

        vTaskDelayUntil(&last_cycle, pdMS_TO_TICKS(TASK_EXPERIMENT_MANAGER_PERIOD_MS));
    }
}

/**
 * \brief Latch-up detection routine.
 *
 * \param[in] sys_package is the current system state queue package.
 *
 * \return The status/error code.
 */
int latchup_detection_routine(sys_state_package_t *sys_package) 
{
    int error = 0;

    /* Check for turn-off commands */
    if(!(sys_package->execution_config & ENABLE_SDRAM_MEMORY_B))
    {
        latchup_monitors_clear_enable(MEMORY_B_LATCHUP_MONITOR);
    }

    if(!(sys_package->execution_config & ENABLE_SDRAM_MEMORY_D))
    {
        latchup_monitors_clear_enable(MEMORY_D_LATCHUP_MONITOR);
    }

    if(!(sys_package->execution_config & ENABLE_SDRAM_MEMORY_F))
    {
        latchup_monitors_clear_enable(MEMORY_F_LATCHUP_MONITOR);
    }

    /* Check for latch-up events */
    if(latchup_monitors_get_status(MEMORY_B_LATCHUP_MONITOR) != 0)
    {
        latchup_monitors_clear_enable(MEMORY_B_LATCHUP_MONITOR);
        sys_package->error_code |= MEMORY_B_LATCHUP;
        sys_package->error_count++;

        if (sys_package->execution_config & FORCE_HALT_AFTER_LATCHUP)
        {
            /* Suspend runner task after latch-up event */
            vTaskSuspend(xTaskExperimentRunnerHandle);
            sys_log_print_event_from_module(SYS_LOG_ERROR, TASK_EXPERIMENT_RUNNER_NAME, "experiment_runner_task halted due to latch-up event in memory B");
        }
        else 
        {
            latchup_monitors_set_enable(MEMORY_B_LATCHUP_MONITOR);
        }

        error = -1;
    }

    if(latchup_monitors_get_status(MEMORY_D_LATCHUP_MONITOR) != 0)
    {
        latchup_monitors_clear_enable(MEMORY_D_LATCHUP_MONITOR);
        sys_package->error_code |= MEMORY_D_LATCHUP;
        sys_package->error_count++;

        if (sys_package->execution_config & FORCE_HALT_AFTER_LATCHUP)
        {
            /* Suspend runner task after latch-up event */
            vTaskSuspend(xTaskExperimentRunnerHandle);
            sys_log_print_event_from_module(SYS_LOG_ERROR, TASK_EXPERIMENT_RUNNER_NAME, "experiment_runner_task halted due to latch-up event in memory D");
        }
        else 
        {
            latchup_monitors_set_enable(MEMORY_D_LATCHUP_MONITOR);
        }

        error = -1;
    }

    if(latchup_monitors_get_status(MEMORY_F_LATCHUP_MONITOR) != 0)
    {
        latchup_monitors_clear_enable(MEMORY_F_LATCHUP_MONITOR);
        sys_package->error_code |= MEMORY_F_LATCHUP;
        sys_package->error_count++;

        if (sys_package->execution_config & FORCE_HALT_AFTER_LATCHUP)
        {
            /* Suspend runner task after latch-up event */
            vTaskSuspend(xTaskExperimentRunnerHandle);
            sys_log_print_event_from_module(SYS_LOG_ERROR, TASK_EXPERIMENT_RUNNER_NAME, "experiment_runner_task halted due to latch-up event in memory F");
        }
        else 
        {
            latchup_monitors_set_enable(MEMORY_F_LATCHUP_MONITOR);
        }

        error = -1;
    }

    return error;
}

/**
 * \brief Experiment runner routine.
 *
 * \param[in] sys_package is the current system state queue package.
 *
 * \param[in] exp_package is the experiment runner command queue package.
 *
 * \return The status/error code.
 */
int experiment_runner_routine(sys_state_package_t *sys_package, experiment_command_package_t *exp_package) 
{
    if (exp_package->execution_config == sys_package->execution_config)
    {
        return 0;
    }
    else 
    {
        exp_package->execution_config = sys_package->execution_config;
        return 1;
    }
}


/** \} End of experiment_manager group */
