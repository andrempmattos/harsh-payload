/*
 * leds.h
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
 * \brief OBC interface definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.23
 * 
 * \date 12/05/2020
 * 
 * \defgroup obc OBC
 * \ingroup devices
 * \{
 */

#ifndef OBC_H_
#define OBC_H_

#include <stdint.h>
	
#define OBC_MODULE_NAME        			"OBC"

/**
 * \brief OBC commands.
 */
typedef struct
{
    uint8_t operation_mode;				/**< Operation mode selection. */
    uint16_t execution_config;			/**< Execution configuration. */
    uint32_t obc_sys_time;				/**< OBC system time syncronization. */
} obc_command_t;

/**
 * \brief OBC data.
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
} obc_data_t;

/**
 * \brief system state.
 */
typedef struct
{
	uint32_t time_stamp;				/**< Current time stamp. */
	uint8_t operation_mode;				/**< Current operation mode. */	
	uint16_t execution_config;			/**< Current execution configuration. */
	uint8_t error_count;				/**< Errors count. */
	uint16_t error_code;				/**< Error code. */
} system_state_t;

/**
 * \brief Initialization routine of the OBC interface.
 *
 * \return The status/error code.
 */
int obc_init(void);

/**
 * \brief Gets commands from OBC.
 *
 * \param[in] command is a pointer store the obc command.
 *
 * \return The status/error code.
 */
int obc_get_command(obc_command_t *command);

/**
 * \brief Gets commands from OBC.
 *
 * \param[in] command is a pointer store the obc data package.
 *
 * \return The status/error code.
 */
int obc_send_data(obc_data_t *data);

/**
 * \brief Gets the general state of the payload.
 *
 * \param[in] command is a pointer store the obc data package.
 *
 * \return The status/error code.
 */
int obc_send_state(system_state_t *state);


#endif /* OBC_H_ */

/** \} End of obc group */
