/*
 * algorithms.h
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
 * \brief Experiment algorithms implementation.
 * 
 * \author Lucas Matana <lucas.matana-luza@lirmm.fr> and Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.45
 * 
 * \date 26/05/2020
 * 
 * \defgroup algorithms Algorithms
 * \ingroup includes
 * \{
 */

#ifndef ALGORITHMS_H_
#define ALGORITHMS_H_

#include <stdint.h>

/* Test algorithms selection definitions */
#define STATIC_LOOP_TEST							0			/**< Static loop test algorithm */			
#define DYNAMIC_LOOP_C_TESTS						1			/**< Dynamic Loop C test algorithm */			
#define DYNAMIC_STRESS_TESTS						2			/**< Dynamic stress test algorithm */			
#define DYNAMIC_E_CLASSIC_TESTS						3			/**< Dynamic E classic test algorithm */			
#define DYNAMIC_F_TESTS								4			/**< Dynamic F test algorithm */

#define MAX_LOG_PAYLOAD_SIZE						20			/**< Maximum log payload package size */

#define DEFAULT_DATA_INJECTION						0x1234
#define MEMORY_HALF_SIZE							0x02000000
#define MEMORY_FULL_SIZE							0x04000000

/**
 * \brief Experiment log header package.
 */
typedef struct
{
	uint32_t time_stamp;				/**< Data package time stamp. */
	uint8_t memory_frequency;			/**< Memory frequency during this test (in MHz). */
	uint16_t refresh_rate;				/**< Memory refresh rate during this test (cycles/ms). */
	uint16_t error;						/**< Total error count (sum of all executed algorithms in that cycle). */
} exp_log_header_t;

/**
 * \brief Experiment log payload package.
 */
typedef struct
{
	uint8_t device;
    uint8_t algorithm;         			/**< Algorithm executed. */
    uint16_t iteration;         		/**< Iteration cycle in dynamic tests. */
    uint32_t error_addr;	         	/**< Address with detected error. */
    uint32_t error_data;   				/**< Data error in the malfunctioning address. */
    uint16_t error;    					/**< Error counter. */
} exp_log_payload_t;

/**
 * \brief Experiment result log header package.
 */
exp_log_header_t log_header;

/**
 * \brief Experiment result log payload package.
 */
exp_log_payload_t log_payload[MAX_LOG_PAYLOAD_SIZE];

/**
 * \brief Static write and read algorithm.
 *
 * \param[in] data_package is the buffer to store the experiment data.
 *
 * \param[in] memory_device is the memory device to be used.
 *
 * \return None.
 */
uint16_t static_loop_algorithm(int memory_device, uint32_t data_injection, uint32_t length);

/**
 * \brief Dynamic loop C algorithm.
 *
 * \param[in] data_package is the buffer to store the experiment data.
 *
 * \param[in] memory_device is the memory device to be used.
 *
 * \return None.
 */
void dynamic_loopc_algorithm(uint8_t *data_package, int memory_device);

/**
 * \brief Dynamic stress algorithm.
 *
 * \param[in] data_package is the buffer to store the experiment data.
 *
 * \param[in] memory_device is the memory device to be used.
 *
 * \return None.
 */
void dynamic_stress_algorithm(uint8_t *data_package, int memory_device);

/**
 * \brief Dynamic E classic algorithm.
 *
 * \param[in] data_package is the buffer to store the experiment data.
 *
 * \param[in] memory_device is the memory device to be used.
 *
 * \return None.
 */
void dynamic_eclassic_algorithm(uint8_t *data_package, int memory_device);

/**
 * \brief Dynamic F algorithm.
 *
 * \param[in] data_package is the buffer to store the experiment data.
 *
 * \param[in] memory_device is the memory device to be used.
 *
 * \return None.
 */
void dynamic_f_algorithm(uint8_t *data_package, int memory_device);

#endif /* ALGORITHMS_H_ */

/** \} End of heartbeat group */
