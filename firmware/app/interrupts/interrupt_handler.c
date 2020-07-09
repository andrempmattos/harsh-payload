/*
 * interrupt_handler.c
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
 * \brief Interrupt handlers implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.43
 * 
 * \date 21/05/2020
 * 
 * \addtogroup interrupt_handler
 * \{
 */

#include <devices/obc/obc.h>
#include <system/config.h>

#include "interrupt_handler.h"

void create_interrupt_handlers() 
{
	/* OBC communication interface interrupt handler semaphore */
	#if CONFIG_SEMAPHORE_HANDLER_OBC_ENABLED == 1
		xBinarySemaphore = xSemaphoreCreateBinary();

		/* Give the semaphore here to allow the first execution of OBC Interface 
		task, which is blocked by this semaphore  */
		//xSemaphoreGive(xBinarySemaphore);

	#endif /* CONFIG_SEMAPHORE_HANDLER_OBC_ENABLED */
}

void spi_cmd_interrupt_handler(uint8_t *rx_buff, uint32_t rx_size)
{
	BaseType_t xHigherPriorityTaskWoken;
	
	/* The xHigherPriorityTaskWoken parameter must be initialized to pdFALSE as
	it will get set to pdTRUE inside the interrupt safe API function if a
	context switch is required. */
	xHigherPriorityTaskWoken = pdFALSE;
	
	/* 'Give' the semaphore to unblock the task, passing in the address of
	xHigherPriorityTaskWoken as the interrupt safe API function's
	pxHigherPriorityTaskWoken parameter. */
	xSemaphoreGiveFromISR( xBinarySemaphore, &xHigherPriorityTaskWoken );
	
	/* Pass the xHigherPriorityTaskWoken value into portYIELD_FROM_ISR(). If
	xHigherPriorityTaskWoken was set to pdTRUE inside xSemaphoreGiveFromISR()
	then calling portYIELD_FROM_ISR() will request a context switch. If
	xHigherPriorityTaskWoken is still pdFALSE then calling
	portYIELD_FROM_ISR() will have no effect. */
	portYIELD_FROM_ISR( xHigherPriorityTaskWoken );
}

/** \} End of interrupt_handler group */
