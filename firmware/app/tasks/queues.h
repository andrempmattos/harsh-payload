/* 
 * queues.h
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
 * \brief Queues definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.20
 * 
 * \date 18/05/2020
 * 
 * \defgroup queues Queues
 * \{
 */

#ifndef QUEUES_H_
#define QUEUES_H_

/* Queue instances */
QueueHandle_t xQueueOBCCommand;
QueueHandle_t xQueueOBCState;
QueueHandle_t xQueueOBCData;
QueueHandle_t xQueueExperimentCommand;
QueueHandle_t xQueueExperimentData;

/**
 * \brief OBC commands queue package.
 */
typedef struct
{
    uint8_t operation_mode;				/**< Operation mode selection. */
    uint16_t execution_config;			/**< Execution configuration. */
    uint32_t obc_sys_time;				/**< OBC system time syncronization. */
} obc_command_package_t;

/**
 * \brief OBC data queue package.
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
} obc_data_package_t;

/**
 * \brief System state queue package.
 */
typedef struct
{
	uint32_t time_stamp;				/**< Current time stamp. */
	uint8_t operation_mode;				/**< Current operation mode. */	
	uint16_t execution_config;			/**< Current execution configuration. */
	uint8_t error_count;				/**< Errors count. */
	uint16_t error_code;				/**< Error code. */
} obc_state_package_t;

/**
 * \brief Experiment command queue package.
 */
typedef struct
{

} experiment_command_package_t;

/**
 * \brief Experiment data queue package.
 */
typedef struct
{

} experiment_data_package_t;

/**
 * \brief Creates the system queues.
 *
 * \return None.
 */
void create_queues();

#endif /* QUEUES_H_ */

/** \} End of queues group */