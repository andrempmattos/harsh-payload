/*
 * rasp_wrapper.h
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
 * \brief Raspberry PI 3 (Model 3A+) wrapper definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.7
 * 
 * \date 23/06/2020
 * 
 * \defgroup harshlib harshlib
 * \ingroup libs
 * \{
 */

#ifndef RASP_WRAPPER_H_
#define RASP_WRAPPER_H_

#include <bcm2835.h>
#include <stdio.h>
#include <stdint.h>

#define OBC_GPIO_0		0
#define OBC_GPIO_1		1


int system_init(void);
void system_close(void);

void gpio_init(void);
void gpio_set(uint8_t pin);
void gpio_clear(uint8_t pin);

int spi_init(void);
void spi_send(uint8_t *send_data, uint8_t length);
void spi_read(uint8_t *read_data, uint8_t length);

void log_print_event(char *module_name, char *msg);

void delay_ms(uint32_t time_ms);
uint32_t get_timestamp(void);

void store_payload_data(uint8_t *data);

#endif /* RASP_WRAPPER_H_ */

/** \} End of rasp_wrapper group */



// bcm2835_spi_end();
// bcm2835_close();
