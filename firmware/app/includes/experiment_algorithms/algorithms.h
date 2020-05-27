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
 * \version 0.0.33
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

/**
 * \brief Static write algorithm.
 *
 * \param[in] data_package is the buffer to store the experiment data.
 *
 * \param[in] memory_device is the memory device to be used.
 *
 * \return None.
 */
void static_write_algorithm(uint8_t *data_package, int memory_device);

/**
 * \brief Static read algorithm.
 *
 * \param[in] data_package is the buffer to store the experiment data.
 *
 * \param[in] memory_device is the memory device to be used.
 *
 * \return None.
 */
void static_read_algorithm(uint8_t *data_package, int memory_device);

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
