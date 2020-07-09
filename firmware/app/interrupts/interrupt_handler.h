/*
 * interrupt_handler.h
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
 * \brief Interrupt handlers definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.43
 * 
 * \date 21/05/2020
 * 
 * \defgroup interrupt_handler Interrupt Handler
 * \ingroup interrupts
 * \{
 */

#ifndef INTERRUPT_HANDLER_H_
#define INTERRUPT_HANDLER_H_

#include <FreeRTOS.h>
#include <semphr.h>

#include <stdint.h>

/**
 * \brief SPI RX buffer interrupt handler.
 *
 * \param[in] package is a pointer to the RX buffer.
 *
 * \param[in] package is the RX buffer size.
 *
 * \return The status/error code.
 */
void spi_cmd_interrupt_handler(uint8_t *rx_buff, uint32_t rx_size);


void create_interrupt_handlers();

QueueHandle_t xBinarySemaphore;

#endif /* INTERRUPT_HANDLER_H_ */

/** \} End of interrupt_handler group */
