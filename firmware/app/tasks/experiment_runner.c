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
 * \version 0.0.23
 * 
 * \date 16/05/2020
 * 
 * \addtogroup experiment_runner
 * \{
 */

//#include <libs/experiment_algorithms.h>
#include <devices/media/media.h>

#include "experiment_runner.h"
#include "queues.h"

xTaskHandle xTaskExperimentRunnerHandle;

/* Local functions prototypes */
void test_manager_routine(experiment_command_package_t *cmd_package, experiment_data_package_t *data_package, experiment_state_package_t *state_package, int test);
int test_runner_routine(experiment_data_package_t *data_package, int test, int memory_device);

void vTaskExperimentRunner(void *pvParameters)
{
    /* Delay before the first cycle */
    vTaskDelay(pdMS_TO_TICKS(TASK_EXPERIMENT_RUNNER_INITIAL_DELAY_MS));

    /* Create local queue experiment command package */
    experiment_command_package_t exp_command = 
    {
        .execution_config = DEFAULT_EXECUTION_CONFIG
    };

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

    /* Create timeout value to start executing the experiment in case of any OBC command */
    uint32_t timeout;

    while(1)
    {
        TickType_t last_cycle = xTaskGetTickCount();

        if (xQueueReceive(xQueueExperimentCommand, &exp_command, 0) == pdPASS) 
        {
            /* Succeed to receive the message, then enable the tests execution */
            execution_state = 1;
        }

        /* Get system ticks and convert to milliseconds */
        timeout = (xTaskGetTickCount() / (uint32_t)configTICK_RATE_HZ) * 1000;

        if (execution_state || (timeout > EXPERIMENT_INIT_TIMEOUT_MS))
        {
        	if (exp_command.execution_config & ENABLE_FREQUENCY_TESTS)
        	{
        			
        	}

        	if (exp_command.execution_config & ENABLE_REFRESH_RATE_TESTS)
        	{
        		 
        	}        	

			if (exp_command.execution_config & ENABLE_STATIC_TESTS)
        	{
        		test_manager_routine(&exp_command, &exp_data, &exp_state, STATIC_WRITE_TEST);
        		test_manager_routine(&exp_command, &exp_data, &exp_state, STATIC_READ_TEST);
        	}

        	if (exp_command.execution_config & ENABLE_DYNAMIC_TESTS)
        	{
        		test_manager_routine(&exp_command, &exp_data, &exp_state, DYNAMIC_LOOP_C_TESTS);
        		test_manager_routine(&exp_command, &exp_data, &exp_state, DYNAMIC_STRESS_TESTS);
        		test_manager_routine(&exp_command, &exp_data, &exp_state, DYNAMIC_E_CLASSIC_TESTS);
        		test_manager_routine(&exp_command, &exp_data, &exp_state, DYNAMIC_F_TESTS);
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
void test_manager_routine(experiment_command_package_t *cmd_package, experiment_data_package_t *data_package, experiment_state_package_t *state_package, int test) 
{
	if (cmd_package->execution_config & ENABLE_SDRAM_MEMORY_B)
	{
		if (test_runner_routine(data_package, test, SDRAM_MEMORY_B) != 0)
		{
		 	if(media_write(MEDIA_ESRAM, state_package->address, (uint8_t *)data_package, sizeof(experiment_data_package_t)) == 0)
	 		{	
	 			state_package->length += sizeof(experiment_data_package_t);
	 		} 
		}
	}

	if (cmd_package->execution_config & ENABLE_SDRAM_MEMORY_D)
	{
		if (test_runner_routine(data_package, test, SDRAM_MEMORY_D) != 0)
		{
		 	if(media_write(MEDIA_ESRAM, state_package->address, (uint8_t *)data_package, sizeof(experiment_data_package_t)) == 0)
	 		{	
	 			state_package->length += sizeof(experiment_data_package_t);
	 		} 
		}	
	}

	if (cmd_package->execution_config & ENABLE_SDRAM_MEMORY_F)
	{
		if (test_runner_routine(data_package, test, SDRAM_MEMORY_F) != 0)
		{
		 	if(media_write(MEDIA_ESRAM, state_package->address, (uint8_t *)data_package, sizeof(experiment_data_package_t)) == 0)
	 		{	
	 			state_package->length += sizeof(experiment_data_package_t);
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
int test_runner_routine(experiment_data_package_t *data_package, int test, int memory_device) 
{

}

/** \} End of experiment_runner group */
