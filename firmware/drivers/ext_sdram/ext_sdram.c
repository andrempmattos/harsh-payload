/*
 * ext_sdram.c
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
 * \brief External SDRAM driver implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.13
 * 
 * \date 13/05/2020
 * 
 * \addtogroup ext_sdram
 * \{
 */

#include <system/sys_log/sys_log.h>
#include <system/config.h>

#include "ext_sdram.h"

int sdram_init(sdram_device_t dev)
{
    #if CONFIG_EXT_SDRAM_TEST_ENABLED == 1
        uint32_t *data, *check;
        *data = DUMMY_TEST_VALUE;
        *check = 0;
        
        sdram_write(dev, 0u, data, 1);
        sdram_read(dev, 0u, check, 1);
        
        if ( (*data) != (*check) )
        {
            return -1;
        }
    #endif /* CONFIG_EXT_SDRAM_TEST_ENABLED */

    return 0;   
}

int sdram_write(sdram_device_t dev, uint32_t addr, uint32_t *data, uint16_t len)
{
    switch(dev)
    {
        case EXT_SDRAM_B:
            addr += EXT_SDRAM_B_START_ADDR;
            if(addr > EXT_SDRAM_B_END_ADDR)
            {
                #if CONFIG_DRIVERS_DEBUG_ENABLED == 1
                    sys_log_print_event_from_module(SYS_LOG_ERROR, EXT_SDRAM_MODULE_NAME, "Invalid memory B address!");
                    sys_log_new_line();
                #endif /* CONFIG_DRIVERS_DEBUG_ENABLED */
                return -1;
            }
            break;
        case EXT_SDRAM_D:
            addr += EXT_SDRAM_D_START_ADDR;
            if(addr > EXT_SDRAM_D_END_ADDR)
            {
                #if CONFIG_DRIVERS_DEBUG_ENABLED == 1
                    sys_log_print_event_from_module(SYS_LOG_ERROR, EXT_SDRAM_MODULE_NAME, "Invalid memory D address!");
                    sys_log_new_line();
                #endif /* CONFIG_DRIVERS_DEBUG_ENABLED */
                return -1;
            }
            break;
        case EXT_SDRAM_F:
            addr += EXT_SDRAM_F_START_ADDR;
            if(addr > EXT_SDRAM_F_END_ADDR)
            {
                #if CONFIG_DRIVERS_DEBUG_ENABLED == 1
                    sys_log_print_event_from_module(SYS_LOG_ERROR, EXT_SDRAM_MODULE_NAME, "Invalid memory F address!");
                    sys_log_new_line();
                #endif /* CONFIG_DRIVERS_DEBUG_ENABLED */
                return -1;
            }
            break;
        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, EXT_SDRAM_MODULE_NAME, "Invalid storage SDRAM device!");
            sys_log_new_line();

            return -1;
    }

    while(len > 0) 
    {
        *(volatile uint32_t *)(addr) = *data++;
        addr = addr + 4;
        len--;
    }    

    return 0;
}

int sdram_read(sdram_device_t dev, uint32_t addr, uint32_t *data, uint16_t len)
{
    switch(dev)
    {
        case EXT_SDRAM_B:
            addr += EXT_SDRAM_B_START_ADDR;
            if(addr > EXT_SDRAM_B_END_ADDR)
            {
                #if CONFIG_DRIVERS_DEBUG_ENABLED == 1
                    sys_log_print_event_from_module(SYS_LOG_ERROR, EXT_SDRAM_MODULE_NAME, "Invalid memory B address!");
                    sys_log_new_line();
                #endif /* CONFIG_DRIVERS_DEBUG_ENABLED */
                return -1;
            }
            break;
        case EXT_SDRAM_D:
            addr += EXT_SDRAM_D_START_ADDR;
            if(addr > EXT_SDRAM_D_END_ADDR)
            {
                #if CONFIG_DRIVERS_DEBUG_ENABLED == 1
                    sys_log_print_event_from_module(SYS_LOG_ERROR, EXT_SDRAM_MODULE_NAME, "Invalid memory D address!");
                    sys_log_new_line();
                #endif /* CONFIG_DRIVERS_DEBUG_ENABLED */
                return -1;
            }
            break;
        case EXT_SDRAM_F:
            addr += EXT_SDRAM_F_START_ADDR;
            if(addr > EXT_SDRAM_F_END_ADDR)
            {
                #if CONFIG_DRIVERS_DEBUG_ENABLED == 1
                    sys_log_print_event_from_module(SYS_LOG_ERROR, EXT_SDRAM_MODULE_NAME, "Invalid memory F address!");
                    sys_log_new_line();
                #endif /* CONFIG_DRIVERS_DEBUG_ENABLED */
                return -1;
            }
            break;
        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, EXT_SDRAM_MODULE_NAME, "Invalid storage SDRAM device!");
            sys_log_new_line();

            return -1;
    }

    while(len > 0) 
    {
        *data++ = *(volatile uint32_t *)(addr);
        addr = addr + 4;
        len--;
    }

    return 0;    
}


/** \} End of ext_sdram group */