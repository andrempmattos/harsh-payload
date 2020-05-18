/*
 * latchup_monitors.c
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
 * \brief Latch-up monitor implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.18
 * 
 * \date 12/05/2020
 * 
 * \addtogroup latchup_monitors
 * \{
 */

#include <system/sys_log/sys_log.h>
#include <drivers/mss_gpio/mss_gpio.h>

#include "latchup_monitors.h"

void latchup_monitors_init()
{
	sys_log_print_event_from_module(SYS_LOG_INFO, LATCHUP_MODULE_NAME, "Initializing latch-up monitors...");
    sys_log_new_line();

    MSS_GPIO_init();

    MSS_GPIO_config(MEMORY_B_LATCHUP_ENABLE_PIN, MSS_GPIO_OUTPUT_MODE);
    MSS_GPIO_config(MEMORY_D_LATCHUP_ENABLE_PIN, MSS_GPIO_OUTPUT_MODE);
    MSS_GPIO_config(MEMORY_F_LATCHUP_ENABLE_PIN, MSS_GPIO_OUTPUT_MODE);

    MSS_GPIO_set_output(MEMORY_B_LATCHUP_ENABLE_PIN, HIGH);
    MSS_GPIO_set_output(MEMORY_D_LATCHUP_ENABLE_PIN, HIGH);
    MSS_GPIO_set_output(MEMORY_F_LATCHUP_ENABLE_PIN, HIGH);

    MSS_GPIO_config(MEMORY_B_LATCHUP_PWGD_STATUS_PIN, MSS_GPIO_INPUT_MODE);
    MSS_GPIO_config(MEMORY_D_LATCHUP_PWGD_STATUS_PIN, MSS_GPIO_INPUT_MODE);
    MSS_GPIO_config(MEMORY_F_LATCHUP_PWGD_STATUS_PIN, MSS_GPIO_INPUT_MODE);
}

int latchup_monitors_get_status(latchup_monitor_t *l)
{
	switch(l)
    {
        case MEMORY_B_LATCHUP_MONITOR:
        	if(MSS_GPIO_get_outputs() & MEMORY_B_LATCHUP_PWGD_STATUS_MASK) 
        	{
        		sys_log_print_event_from_module(SYS_LOG_INFO, LATCHUP_MODULE_NAME, "Memory B latch-up detection status: None");
            	sys_log_new_line();
            	return HIGH;
        	}
        	else 
        	{
        		sys_log_print_event_from_module(SYS_LOG_WARNING, LATCHUP_MODULE_NAME, "Memory B latch-up detection status: Critical");
            	sys_log_new_line();
            	return LOW;
        	}
        case MEMORY_D_LATCHUP_MONITOR:
            if(MSS_GPIO_get_outputs() & MEMORY_D_LATCHUP_PWGD_STATUS_MASK) 
        	{
        		sys_log_print_event_from_module(SYS_LOG_INFO, LATCHUP_MODULE_NAME, "Memory D latch-up detection status: None");
            	sys_log_new_line();
            	return HIGH;
        	}
        	else 
        	{
        		sys_log_print_event_from_module(SYS_LOG_WARNING, LATCHUP_MODULE_NAME, "Memory D latch-up detection status: Critical");
            	sys_log_new_line();
            	return LOW;
        	}
        case MEMORY_F_LATCHUP_MONITOR:
            if(MSS_GPIO_get_outputs() & MEMORY_B_LATCHUP_PWGD_STATUS_MASK) 
        	{
        		sys_log_print_event_from_module(SYS_LOG_INFO, LATCHUP_MODULE_NAME, "Memory F latch-up detection status: None");
            	sys_log_new_line();
            	return HIGH;
        	}
        	else 
        	{
        		sys_log_print_event_from_module(SYS_LOG_WARNING, LATCHUP_MODULE_NAME, "Memory F latch-up detection status: Critical");
            	sys_log_new_line();
            	return LOW;
        	}
        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, LATCHUP_MODULE_NAME, "Invalid latch-up monitor device!");
            sys_log_new_line();
            return -1;
    }
}

int latchup_monitors_set_enable(latchup_monitor_t *l)
{
	switch(l)
    {
        case MEMORY_B_LATCHUP_MONITOR:
        	MSS_GPIO_set_output(MEMORY_B_LATCHUP_ENABLE_PIN, HIGH);
        	sys_log_print_event_from_module(SYS_LOG_WARNING, LATCHUP_MODULE_NAME, "Memory B latch-up monitor enabled");
            sys_log_new_line();
            return 0;
        case MEMORY_D_LATCHUP_MONITOR:
        	MSS_GPIO_set_output(MEMORY_D_LATCHUP_ENABLE_PIN, HIGH);
            sys_log_print_event_from_module(SYS_LOG_WARNING, LATCHUP_MODULE_NAME, "Memory D latch-up monitor enabled");
            sys_log_new_line();
            return 0;
        case MEMORY_F_LATCHUP_MONITOR:
        	MSS_GPIO_set_output(MEMORY_F_LATCHUP_ENABLE_PIN, HIGH);
            sys_log_print_event_from_module(SYS_LOG_WARNING, LATCHUP_MODULE_NAME, "Memory F latch-up monitor enabled");
            sys_log_new_line();
            return 0;
        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, LATCHUP_MODULE_NAME, "Invalid latch-up monitor device!");
            sys_log_new_line();
            return -1;
    }
}

int latchup_monitors_clear_enable(latchup_monitor_t *l)
{
	switch(l)
    {
        case MEMORY_B_LATCHUP_MONITOR:
        	MSS_GPIO_set_output(MEMORY_B_LATCHUP_ENABLE_PIN, LOW);
        	sys_log_print_event_from_module(SYS_LOG_WARNING, LATCHUP_MODULE_NAME, "Memory B latch-up monitor disabled");
            sys_log_new_line();
            return 0;
        case MEMORY_D_LATCHUP_MONITOR:
        	MSS_GPIO_set_output(MEMORY_D_LATCHUP_ENABLE_PIN, LOW);
            sys_log_print_event_from_module(SYS_LOG_WARNING, LATCHUP_MODULE_NAME, "Memory D latch-up monitor disabled");
            sys_log_new_line();
            return 0;
        case MEMORY_F_LATCHUP_MONITOR:
        	MSS_GPIO_set_output(MEMORY_F_LATCHUP_ENABLE_PIN, LOW);
            sys_log_print_event_from_module(SYS_LOG_WARNING, LATCHUP_MODULE_NAME, "Memory F latch-up monitor disabled");
            sys_log_new_line();
            return 0;
        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, LATCHUP_MODULE_NAME, "Invalid latch-up monitor device!");
            sys_log_new_line();
            return -1;
    }
}


/** \} End of latchup_monitors group */
