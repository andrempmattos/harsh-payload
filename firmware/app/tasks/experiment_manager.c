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
 * \version 0.0.21
 * 
 * \date 09/05/2020
 * 
 * \addtogroup experiment_manager
 * \{
 */

#include <devices/latchup_monitors/latchup_monitors.h>
#include <devices/obc/obc.h>

#include "experiment_manager.h"
#include "queues.h"

xTaskHandle xTaskExperimentManagerHandle;

/* Local functions prototypes */
int latchup_detection_routine(sys_state_package_t *sys_package);
int experiment_runner_routine(sys_state_package_t *sys_package, experiment_command_package_t *exp_package);

void vTaskExperimentManager(void *pvParameters)
{
    /* Delay before the first cycle */
    vTaskDelay(pdMS_TO_TICKS(TASK_EXPERIMENT_MANAGER_INITIAL_DELAY_MS));
    
    /* Create local queue package */
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
    experiment_command_package_t exp_command;

    /* Create local queue experiment command package */
    experiment_data_package_t exp_data;

    while(1)
    {
        TickType_t last_cycle = xTaskGetTickCount();


        if (xQueueReceive(xQueueOBCCommand, &obc_command, 0) == pdPASS) 
        {
            /* Succeed to receive the message, then update the system state variables */
            sys_state.time_stamp = obc_command.obc_sys_time;
            sys_state.operation_mode = obc_command.operation_mode;
            sys_state.execution_config = obc_command.execution_config;
        }

        if(latchup_detection_routine(sys_state) != 0) 
        {
            /* Get system ticks, convert to milliseconds and add to system time stamp */
            sys_state.time_stamp += ((xTaskGetTickCount() / (uint32_t)configTICK_RATE_HZ) * 1000);
            
            /* Send system status if latch-up detected */
            xQueueSendToBack(xQueueSystemState, &sys_state, 0);
        }

        if (experiment_runner_routine(sys_state, exp_command))
        {
            /* Send the command to be executed in the experiment runner task */
            xQueueSendToBack(xQueueExperimentCommand, &exp_command, 0);   
        }

        if (xQueueReceive(xQueueExperimentData, &exp_data, 0) == pdPASS) 
        {
            obc_data = exp_data;
            xQueueSendToBack(xQueueOBCData, &obc_data, 0);
        }
        
        /* Restore the system state variable error code for the next cycle */            
        sys_state.error_code = 0 

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
    if(!(sys_package.execution_config & ENABLE_SDRAM_MEMORY_B))
    {
        latchup_monitors_clear_enable(MEMORY_B_LATCHUP_MONITOR);
    }

    if(!(sys_package.execution_config & ENABLE_SDRAM_MEMORY_D))
    {
        latchup_monitors_clear_enable(MEMORY_D_LATCHUP_MONITOR);
    }

    if(!(sys_package.execution_config & ENABLE_SDRAM_MEMORY_F))
    {
        latchup_monitors_clear_enable(MEMORY_F_LATCHUP_MONITOR);
    }

    /* Check for latch-up events */
    if(latchup_monitors_get_status(MEMORY_B_LATCHUP_MONITOR) != 0)
    {
        latchup_monitors_clear_enable(MEMORY_B_LATCHUP_MONITOR);
        sys_package.error_code |= MEMORY_B_LATCHUP;
        sys_package.error_count++;

        if (sys_package.execution_config & FORCE_HALT_AFTER_LATCHUP)
        {
            // Add log
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
        sys_package.error_code |= MEMORY_D_LATCHUP;
        sys_package.error_count++;

        if (sys_package.execution_config & FORCE_HALT_AFTER_LATCHUP)
        {
            // Add log
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
        sys_package.error_code |= MEMORY_F_LATCHUP;
        sys_package.error_count++;

        if (sys_package.execution_config & FORCE_HALT_AFTER_LATCHUP)
        {
            // Add log
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
 * \param[in] sys_package is the experiment runner command queue package.
 *
 * \return The status/error code.
 */
int experiment_runner_routine(sys_state_package_t *sys_package, experiment_command_package_t *exp_package) 
{
    if (exp_package.execution_config == sys_package.execution_config)
    {
        return 0;
    }
    else 
    {
        exp_package.execution_config = sys_package.execution_config;
        return 1;
    }
}


/** \} End of experiment_manager group */
