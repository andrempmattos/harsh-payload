/*
 * startup.c
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
 * \brief Startup task implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.15
 * 
 * \date 09/05/2020
 * 
 * \addtogroup startup
 * \{
 */

#include <stdbool.h>

#include <system/config.h>
#include <system/sys_log/sys_log.h>
#include <devices/leds/leds.h>
#include <devices/watchdog/watchdog.h>

#include "startup.h"

xTaskHandle xTaskStartupHandle;

//EventGroupHandle_t task_startup_status;

void vTaskStartup(void *pvParameters)
{
    bool error = false;

    /* Watchdog device initialization */
    watchdog_init()

    /* Logger device initialization */
    sys_log_init();

    /* Print the FreeRTOS version */
    sys_log_print_event_from_module(SYS_LOG_INFO, TASK_STARTUP_NAME, "FreeRTOS ");
    sys_log_print_msg(tskKERNEL_VERSION_NUMBER);
    sys_log_new_line();

    /* Print the system clocks */
    sys_log_print_event_from_module(SYS_LOG_INFO, TASK_STARTUP_NAME, "System clock: 100MHz");
    sys_log_new_line();

    /* LEDs device initialization */
    leds_init();

    if (error)
    {
        sys_log_print_event_from_module(SYS_LOG_ERROR, TASK_STARTUP_NAME, "Boot completed with ERRORS!");
        sys_log_new_line();

        led_set();
    }
    else
    {
        sys_log_print_event_from_module(SYS_LOG_INFO, TASK_STARTUP_NAME, "Boot completed with SUCCESS!");
        sys_log_new_line();

        led_clear();
    }

    /* Startup task status = Done */
    //xEventGroupSetBits(task_startup_status, TASK_STARTUP_DONE);

    vTaskSuspend(xTaskStartupHandle);
}

/** \} End of startup group */
