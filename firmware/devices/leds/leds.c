/*
 * leds.c
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
 * \brief System LEDs implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.3
 * 
 * \date 09/05/2020
 * 
 * \addtogroup leds
 * \{
 */

#include <system/sys_log/sys_log.h>
#include <drivers/mss_gpio/mss_gpio.h>

#include "leds.h"

void leds_init()
{
    sys_log_print_event_from_module(SYS_LOG_INFO, LEDS_MODULE_NAME, "Initializing system LEDs...");
    sys_log_new_line();

    MSS_GPIO_init();

    MSS_GPIO_config(LED_SYSTEM_PIN, MSS_GPIO_OUTPUT_MODE);
    MSS_GPIO_set_output(LED_SYSTEM_PIN, LOW);
}

void led_set(void)
{
    MSS_GPIO_set_output(LED_SYSTEM_PIN, HIGH);
}

void led_clear(void)
{
    MSS_GPIO_set_output(LED_SYSTEM_PIN, LOW);
}

void led_toggle(void)
{
    if ((MSS_GPIO_get_outputs() & LED_SYSTEM_PIN_MASK) == HIGH)
    {
        MSS_GPIO_set_output(LED_SYSTEM, LOW);
    }
    else 
    {
        MSS_GPIO_set_output(LED_SYSTEM, HIGH);    
    }
}

/** \} End of leds group */
