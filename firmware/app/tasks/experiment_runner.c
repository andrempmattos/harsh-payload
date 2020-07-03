/*
 * experiment_runner.c
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
 * \brief Experiment runner task implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.39
 * 
 * \date 16/05/2020
 * 
 * \addtogroup experiment_runner
 * \{
 */

#include <system/sys_log/sys_log.h>

#include <app/includes/experiment_algorithms/algorithms.h>
#include <devices/media/sys_media.h>
#include <app/queues/queues.h>

#include "experiment_runner.h"

xTaskHandle xTaskExperimentRunnerHandle;

/* Local functions prototypes */
void test_manager_routine(experiment_command_package_t *cmd_package, experiment_state_package_t *state_package, int test);
int test_runner_routine(int test, int memory_device);

void vTaskExperimentRunner(void *pvParameters)
{
    /* Suspension before the first cycle */
    sys_log_print_event_from_module(SYS_LOG_WARNING, TASK_EXPERIMENT_RUNNER_NAME, "Task suspended: ExperimentRunner");
    sys_log_new_line();
    vTaskSuspend(xTaskExperimentRunnerHandle);

    /* Create local queue experiment command package */
    experiment_command_package_t exp_command;

    /* Create local queue experiment state package */
    experiment_state_package_t exp_state = 
    {
    	.package_id = 0,
		.address = 0,
		.length = 0
    };

    /* Create local experiment data package */
    experiment_data_package_t exp_data;

    /* Create local execution state variable to check when the test should be executed */
    int execution_state = 0;

    while(1)
    {
        TickType_t last_cycle = xTaskGetTickCount();

        if (xQueueReceive(xQueueExperimentCommand, &exp_command, 0) == pdPASS) 
        {
            /* Succeed to receive the message, then enable the tests execution */
            execution_state = 1;
        }

		if (execution_state)
		{
			if (exp_command.execution_config & ENABLE_FREQUENCY_TESTS)
			{

			}

			if (exp_command.execution_config & ENABLE_REFRESH_RATE_TESTS)
			{

			}

			if (exp_command.execution_config & ENABLE_STATIC_TESTS)
			{
				test_manager_routine(&exp_command, &exp_state, STATIC_LOOP_TEST);
			}

			if (exp_command.execution_config & ENABLE_DYNAMIC_TESTS)
			{
				test_manager_routine(&exp_command, &exp_state, DYNAMIC_LOOP_C_TESTS);
				test_manager_routine(&exp_command, &exp_state, DYNAMIC_STRESS_TESTS);
				test_manager_routine(&exp_command, &exp_state, DYNAMIC_E_CLASSIC_TESTS);
				test_manager_routine(&exp_command, &exp_state, DYNAMIC_F_TESTS);
			}


			if (exp_state.length > 0)
			{
				xQueueSendToBack(xQueueExperimentState, &exp_state, 0);

				exp_state.package_id++;
				exp_state.address += exp_state.length;
				exp_state.length = 0;
			}
		}

        vTaskDelayUntil(&last_cycle, pdMS_TO_TICKS(TASK_EXPERIMENT_RUNNER_PERIOD_MS));
    }
}

/**
 * \brief Test manager routine.
 *
 * \param[in] cmd_package is the current command queue package.
 *
 * \param[in] data_package is the current experiment data queue package.
 *
 * \param[in] state_package is the current state data queue package.
 *
 * \param[in] test is the test to be executed.
 *
 * \return None.
 */
void test_manager_routine(experiment_command_package_t *cmd_package, experiment_state_package_t *state_package, int test) 
{
    int log_size = 0;

	if (cmd_package->execution_config & ENABLE_SDRAM_MEMORY_B)
	{
        sys_log_print_event_from_module(SYS_LOG_INFO, TASK_EXPERIMENT_RUNNER_NAME, "Performing memory B test: ");

        log_size = test_runner_routine(test, SDRAM_MEMORY_B);
		if (log_size > 0)
		{
            sys_log_print_event_from_module(SYS_LOG_WARNING, TASK_EXPERIMENT_RUNNER_NAME, "Report memory D test: ");
            sys_log_print_dec(log_size);
            sys_log_print_msg(" error bytes");
            sys_log_new_line();

		 	if(sys_media_write(MEDIA_ESRAM, state_package->address, (uint8_t *)log_payload, log_size) == 0)
	 		{	
	 			state_package->length += log_size;
                sys_log_print_event_from_module(SYS_LOG_WARNING, TASK_EXPERIMENT_RUNNER_NAME, "Report embedded SRAM memory usage: ");
                sys_log_print_dec((state_package->length)/(ESRAM_MAX_SIZE));
                sys_log_print_msg("%");
	 		} 
		}
	}

	if (cmd_package->execution_config & ENABLE_SDRAM_MEMORY_D)
	{
        sys_log_print_event_from_module(SYS_LOG_INFO, TASK_EXPERIMENT_RUNNER_NAME, "Performing memory D test: ");

		log_size = test_runner_routine(test, SDRAM_MEMORY_D);

        if (log_size > 0)
		{
            sys_log_print_event_from_module(SYS_LOG_WARNING, TASK_EXPERIMENT_RUNNER_NAME, "Report memory D test: ");
            sys_log_print_dec(log_size);
            sys_log_print_msg(" error bytes");
            sys_log_new_line();

		 	if(sys_media_write(MEDIA_ESRAM, state_package->address, (uint8_t *)log_payload, log_size) == 0)
	 		{	
	 			state_package->length += log_size;
                sys_log_print_event_from_module(SYS_LOG_WARNING, TASK_EXPERIMENT_RUNNER_NAME, "Report embedded SRAM memory usage: ");
                sys_log_print_dec((state_package->length)/(ESRAM_MAX_SIZE));
                sys_log_print_msg("%");
	 		} 
		}	
	}

	if (cmd_package->execution_config & ENABLE_SDRAM_MEMORY_F)
	{
        sys_log_print_event_from_module(SYS_LOG_INFO, TASK_EXPERIMENT_RUNNER_NAME, "Performing memory F test: ");

		log_size = test_runner_routine(test, SDRAM_MEMORY_F);
        if (log_size > 0)
        {
            sys_log_print_event_from_module(SYS_LOG_WARNING, TASK_EXPERIMENT_RUNNER_NAME, "Report memory D test: ");
            sys_log_print_dec(log_size);
            sys_log_print_msg(" error bytes");
            sys_log_new_line();
            
		 	if(sys_media_write(MEDIA_ESRAM, state_package->address, (uint8_t *)log_payload, log_size) == 0)
	 		{	
	 			state_package->length += log_size;
                sys_log_print_event_from_module(SYS_LOG_WARNING, TASK_EXPERIMENT_RUNNER_NAME, "Report embedded SRAM memory usage: ");
                sys_log_print_dec((state_package->length)/(ESRAM_MAX_SIZE));
                sys_log_print_msg("%");
	 		} 
		}
	}
}

/**
 * \brief Test manager routine.
 *
 * \param[in] data_package is the current experiment data queue package.
 *
 * \param[in] test is the test to be executed.
 *
 * \param[in] memory_device is the memory device to be used in the test.
 *
 * \return The status/error code.
 */
int test_runner_routine(int test, int memory_device) 
{
    switch(test)
    {
        case STATIC_LOOP_TEST:
            sys_log_print_msg("static loop algorithm");
            sys_log_new_line();
            return static_loop_algorithm(memory_device, DEFAULT_DATA_INJECTION, MEMORY_FULL_SIZE);
        
        case DYNAMIC_LOOP_C_TESTS:
            sys_log_print_msg("dynamic loop c algorithm");
            sys_log_new_line();
            //return dynamic_loopc_algorithm(memory_device);
            return 0;
        
        case DYNAMIC_STRESS_TESTS:
            sys_log_print_msg("dynamic stress algorithm");
            sys_log_new_line();
            //return dynamic_stress_algorithm(memory_device);
            return 0;
        
        case DYNAMIC_E_CLASSIC_TESTS:
            sys_log_print_msg("dynamic e classic algorithm");
            sys_log_new_line();
            //return dynamic_eclassic_algorithm(memory_device);
            return 0;
        
        case DYNAMIC_F_TESTS:
            sys_log_print_msg("dynamic f algorithm");
            sys_log_new_line();
            //return dynamic_f_algorithm(memory_device); 
            return 0;       
        
        default:
            return -1;
    }
}

/** \} End of experiment_runner group */
