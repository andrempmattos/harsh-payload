/*
 * config.h
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
 * \brief Configuration parameters definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.23
 * 
 * \date 08/05/2020
 * 
 * \defgroup config Configuration
 * \{
 */

#ifndef CONFIG_H_
#define CONFIG_H_

/* Tasks */
#define CONFIG_TASK_STARTUP_ENABLED                     1
#define CONFIG_TASK_WATCHDOG_RESET_ENABLED              1
#define CONFIG_TASK_HEARTBEAT_ENABLED                   1
#define CONFIG_TASK_EXPERIMENT_MANAGER_ENABLED          1
#define CONFIG_TASK_EXPERIMENT_RUNNER_ENABLED	        1

/* Queues */
#define CONFIG_QUEUE_OBC_COMMAND_ENABLED                1
#define CONFIG_QUEUE_OBC_DATA_ENABLED              		1
#define CONFIG_QUEUE_SYS_STATE_ENABLED                  1
#define CONFIG_QUEUE_EXPERIMENT_COMMAND_ENABLED         1
#define CONFIG_QUEUE_EXPERIMENT_STATE_ENABLED	        1

/* Debug and log messages */
#define CONFIG_DRIVERS_DEBUG_ENABLED                    1

/* SDRAM test during initialization  */
#define CONFIG_EXT_SDRAM_TEST_ENABLED                   0


#endif /* CONFIG_H_ */

/** \} End of config group */
