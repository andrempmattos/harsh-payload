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
 * \version 0.0.19
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
#define TASK_EXPERIMENT_RUNNER_PERIOD_MS           	1000             		/**< Period in milliseconds. */
#define TASK_EXPERIMENT_RUNNER_INITIAL_DELAY_MS		15000					/**< Delay, in milliseconds, before the first execution. */
#define TASK_EXPERIMENT_RUNNER_INIT_TIMEOUT_MS     	2000            		/**< Wait time to initialize the task in milliseconds. */

/**
 * \brief Experiment runner task handle.
 */
extern xTaskHandle xTaskExperimentRunnerHandle;

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
