/* 
 * main.c
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
 * \brief Main file.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.33
 * 
 * \date 27/03/2020
 * 
 * \defgroup main Main file
 * \{
 */

#include <FreeRTOS.h>
#include <task.h>

#include "devices/watchdog/watchdog.h"
#include "app/tasks/tasks.h"
#include <app/queues/queues.h>

void main(void)
{
    /* Prepare the essential hardware initializations to start running the operating system. */
    //prvSetupHardware();
    watchdog_init();

    /* Create all the system tasks */
    create_tasks();

    /* Create all the system queues */
    create_queues();

    /* Create all the interrupt handlers */
    create_interrupt_handlers();

    /* Start the scheduler */
    vTaskStartScheduler();

    /* Will only get here if there was insufficient memory to create the idle and/or timer task */
    while(1);
}



