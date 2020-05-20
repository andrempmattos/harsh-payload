/*
 * experiment_runner.h
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
 * \brief Experiment runner task definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.23
 * 
 * \date 16/05/2020
 * 
 * \defgroup experiment_runner ExperimentRunner
 * \ingroup tasks
 * \{
 */

#ifndef EXPERIMENT_RUNNER_H_
#define EXPERIMENT_RUNNER_H_

#include <FreeRTOS.h>
#include <task.h>

#define TASK_EXPERIMENT_RUNNER_NAME        			"ExperimentRunner"     	/**< Task name. */
#define TASK_EXPERIMENT_RUNNER_STACK_SIZE          	500             		/**< Memory stack size in bytes. */
#define TASK_EXPERIMENT_RUNNER_PRIORITY            	3               		/**< Priority. */
#define TASK_EXPERIMENT_RUNNER_PERIOD_MS           	2000             		/**< Period in milliseconds. */
#define TASK_EXPERIMENT_RUNNER_INITIAL_DELAY_MS		(10*1000)				/**< Delay, in milliseconds, before the first execution. */
#define TASK_EXPERIMENT_RUNNER_INIT_TIMEOUT_MS     	2000            		/**< Wait time to initialize the task in milliseconds. */

/* Test algorithms selection definitions */
#define STATIC_WRITE_TEST							0						/**< Static write test algorithm */		
#define STATIC_READ_TEST							1						/**< Static read test algorithm */		
#define DYNAMIC_LOOP_C_TESTS						2						/**< Dynamic Loop C test algorithm */			
#define DYNAMIC_STRESS_TESTS						3						/**< Dynamic stress test algorithm */			
#define DYNAMIC_E_CLASSIC_TESTS						4						/**< Dynamic E classic test algorithm */			
#define DYNAMIC_F_TESTS								5						/**< Dynamic F test algorithm */	

/* Memory devices selection definitions */
#define SDRAM_MEMORY_B								0						/**< SDRAM memory B device */
#define SDRAM_MEMORY_D								1						/**< SDRAM memory D device */
#define SDRAM_MEMORY_F								2						/**< SDRAM memory F device */

#define EXPERIMENT_INIT_TIMEOUT_MS     				2000            		/**< Wait time to initialize the experiment in milliseconds. */

#define DEFAULT_EXECUTION_CONFIG     	0x1F        /**< Standard execution configuration: Memories, static and dynamic tests enabled. */

/**
 * \brief Experiment runner task handle.
 */
extern xTaskHandle xTaskExperimentRunnerHandle;

/**
 * \brief Experiment data package.
 */
typedef struct
{
	uint32_t time_stamp;				/**< Data time stamp. */
	uint8_t device;						/**< Device in test. */
	uint8_t memory_frequency;			/**< Memory frequency during this test (in MHz). */
	uint16_t refresh_rate;				/**< Memory refresh rate during this test (cycles/ms). */
    uint8_t algorithm;         			/**< Algorithm executed. */
    uint16_t iteration;         		/**< Iteration cycle in dynamic tests. */
    uint32_t address;	         		/**< Address with detected error. */
    uint32_t data;         				/**< Data in the malfunctioning address. */
    uint16_t error;         			/**< Error code. */
} experiment_data_package_t;

/**
 * \brief Experiment runner task.
 *
 * \param[in] pvParameters is a value that will passed as the task's parameter.
 *
 * \return None.
 */
void vTaskExperimentRunner(void *pvParameters);

#endif /* EXPERIMENT_RUNNER_H_ */

/** \} End of experiment_runner group */
