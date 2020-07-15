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
 * \version 0.0.44
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

#define MAX_COMMAND_SIZE    			8
#define MAX_TRANSACTION_SIZE    		20

uint8_t slave_rx_buffer[MAX_TRANSACTION_SIZE];

/**
 * \brief Initialization routine of the OBC interface.
 *
 * \return The status/error code.
 */
int obc_init(void);

/**
 * \brief Read commands from OBC.
 *
 * \param[in] package is a pointer to store the obc package.
 *
 * \return None.
 */
void obc_read(uint8_t *package, uint16_t length);

/**
 * \brief Send data to OBC.
 *
 * \param[in] package is a pointer that stores the obc package.
 *
 * \param[in] package is the obc package length.
 *
 * \return None.
 */
void obc_send(uint8_t *package, uint8_t package_len);


#endif /* OBC_H_ */

/** \} End of obc group */
