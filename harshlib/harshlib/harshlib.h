/*
 * harshlib.h
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
 * \brief Harsh Payload API library definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.1
 * 
 * \date 23/06/2020
 * 
 * \defgroup harshlib harshlib
 * \ingroup libs
 * \{
 */

#ifndef HARSHLIB_H_
#define HARSHLIB_H_

#define HARSH_BOARD_ENABLE_N_PIN		OBC_GPIO_0
#define HARSH_FPGA_ENABLE_PIN			OBC_GPIO_1

/* Operation modes */
#define EXPERIMENT_PAYLOAD          	0       /**< Experiment payload operation mode. */
#define HEALTH_MONITOR              	1       /**< Health monitor operation mode. */

/* Execution configuration bits */
#define ENABLE_SDRAM_MEMORY_B       	(1 << 0)       /**< Enable the SDRAM memory B. */
#define ENABLE_SDRAM_MEMORY_D       	(1 << 1)       /**< Enable the SDRAM memory D. */
#define ENABLE_SDRAM_MEMORY_F       	(1 << 2)       /**< Enable the SDRAM memory F. */
#define ENABLE_STATIC_TESTS         	(1 << 3)       /**< Enable static algorithm tests. */
#define ENABLE_DYNAMIC_TESTS        	(1 << 4)       /**< Enable dynamic algorithm tests. */
#define ENABLE_FREQUENCY_TESTS      	(1 << 5)       /**< Enable frequency variation tests. */
#define ENABLE_REFRESH_RATE_TESTS   	(1 << 6)       /**< Enable refresh rate variation tests. */
#define FORCE_LOW_POWER      			(1 << 7)       /**< Force low power execution. */
#define FORCE_REDUCED_LOG      			(1 << 8)       /**< Force reduced log report. */
#define FORCE_HALT_AFTER_LATCHUP		(1 << 9)       /**< Force system halt after latchup. */

/* State error code bits */
#define EXPERIMENT_FAILURE     			(1 << 0)       /**< Experiment execution error. */
#define MEMORY_B_INTERFACE_ERROR		(1 << 1)       /**< SDRAM memory B interface error. */
#define MEMORY_D_INTERFACE_ERROR       	(1 << 2)       /**< SDRAM memory D interface error. */
#define MEMORY_F_INTERFACE_ERROR        (1 << 3)       /**< SDRAM memory F interface error. */
#define MEMORY_B_LATCHUP        		(1 << 4)       /**< SDRAM memory B latchup detection. */
#define MEMORY_D_LATCHUP      			(1 << 5)       /**< SDRAM memory D latchup detection. */
#define MEMORY_F_LATCHUP      			(1 << 6)       /**< SDRAM memory F latchup detection. */
//#define BOOT_FAILURE     				(1 << 7)       /**< Initialization error. */
//#define SYSTEM_FAILURE     			(1 << 8)       /**< System error. */


/**
 * \brief Commands package.
 */
typedef struct
{
    uint8_t operation_mode;				/**< Operation mode selection. */
    uint16_t execution_config;			/**< Execution configuration. */
    uint32_t obc_sys_time;				/**< OBC system time syncronization. */
} command_package_t;

/**
 * \brief Data package.
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
} data_package_t;

/**
 * \brief System state package.
 */
typedef struct
{
	uint32_t time_stamp;				/**< Current time stamp. */
	uint8_t operation_mode;				/**< Current operation mode. */	
	uint16_t execution_config;			/**< Current execution configuration. */
	uint8_t error_count;				/**< Errors count. */
	uint16_t error_code;				/**< Error code. */
    uint8_t data_packages_count;        /**< Remaining data packages count. */
} state_package_t;


/**
 * \brief Harsh Payload initialization and setup routine (keep payload turned-off).
 *
 * \param[] None.
 *
 * \return The status/error code.
 */
int harsh_init(void);

/**
 * \brief Harsh Payload experiment initialization (turn-on the payload).
 *
 * \param[] None.
 *
 * \return The status/error code.
 */
int harsh_start(void);

/**
 * \brief Harsh Payload finalization routine (turn-off the payload).
 *
 * \param[] None.
 *
 * \return The status/error code.
 */
int harsh_stop(void);

/**
 * \brief Harsh Payload set experiment configuration parameters routine.
 *
 * \param[in] cmd is the command package including time stamp, operation mode and config parameters.
 *
 * \return The status/error code.
 */
int harsh_set_config(command_package_t *cmd);

/**
 * \brief Harsh Payload get state package routine.
 *
 * \param[out] state is a buffer to receive the state package.
 *
 * \return The status/error code.
 */
int harsh_get_state(state_package_t *state);

/**
 * \brief Harsh Payload get data package routine.
 *
 * \param[out] data is a buffer to receive the data package.
 *
 * \return The status/error code.
 */
int harsh_get_data(data_package_t *data);

#endif /* HARSHLIB_H_ */

/** \} End of harshlib group */