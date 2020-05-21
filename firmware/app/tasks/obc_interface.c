/*
 * obc_interface.c
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
 * \brief OBC communication interface task implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.24
 * 
 * \date 21/05/2020
 * 
 * \addtogroup obc_interface
 * \{
 */

#include "obc_interface.h"

xTaskHandle xTaskOBCInterfaceHandle;

void vTaskOBCInterface(void *pvParameters)
{
    while(1)
    {
    	/* This binary semaphore is used to wait for the interrupt event release. 
    	The task blocks indefinitely, meaning this function call will only return 
    	once the semaphore has been successfully obtained.*/
		xSemaphoreTake( xBinarySemaphore, portMAX_DELAY );
		
		/* To get here the event must have occurred. */
		//Do something


    }
}

/** \} End of obc_interface group */
