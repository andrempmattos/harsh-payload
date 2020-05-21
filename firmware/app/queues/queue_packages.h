/* 
 * queues_packages.h
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
 * \brief Queues packages definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.28
 * 
 * \date 18/05/2020
 * 
 * \defgroup queues_packages Queues Packages
 * \{
 */

#ifndef QUEUE_PACKAGES_H_
#define QUEUE_PACKAGES_H_


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

/*
typedef struct {                            // This struct is inverted because the MSP memory allocation
    unsigned armed              :1;
    unsigned antenna_burning_4  :1;
    unsigned antenna_cause_4    :1;
    unsigned deploy_status_4    :1;
    unsigned independent_burn   :1;
    unsigned antenna_burning_3  :1;
    unsigned antenna_cause_3    :1;
    unsigned deploy_status_3    :1;
    unsigned ignoring_switches  :1;
    unsigned antenna_burning_2  :1;
    unsigned antenna_cause_2    :1;
    unsigned deploy_status_2    :1;
    unsigned null               :1;
    unsigned antenna_burning_1  :1;
    unsigned antenna_cause_1    :1;
    unsigned deploy_status_1    :1;
} report_t;
*/

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
} sys_state_package_t;

/**
 * \brief Experiment command queue package.
 */
typedef struct
{
	uint16_t execution_config;			/**< Execution configuration. */
} experiment_command_package_t;

/**
 * \brief Experiment data queue package.
 */
typedef struct
{
	uint16_t package_id;				/**< Package ID(incremented each tests cycle). */
	uint32_t address;				    /**< Test result SRAM(experiment data storage device) start address. */
    uint32_t length;                    /**< Test result SRAM(experiment data storage device) data length. */
} experiment_state_package_t;

#endif /* QUEUE_PACKAGES_H_ */

/** \} End of queues_packages group */
