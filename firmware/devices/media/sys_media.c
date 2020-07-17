/*
 * sys_media.c
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
 * \brief System media device implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.47
 * 
 * \date 13/05/2020
 * 
 * \addtogroup sys_media
 * \{
 */

#include <system/sys_log/sys_log.h>
#include <system/config.h>
#include <drivers/mss_nvm/mss_nvm.h>
//#include <drivers/mss_esram/mss_esram.h>

#include "sys_media.h"

int sys_media_init(media_t med)
{
    switch(med)
    {
        case MEDIA_ENVM:
            sys_log_print_event_from_module(SYS_LOG_INFO, SYS_MEDIA_MODULE_NAME, "Initializing eNVM memory...");
            sys_log_new_line();

            #if CONFIG_MSS_ENVM_TEST_ENABLED == 1
                sys_log_print_event_from_module(SYS_LOG_WARNING, SYS_MEDIA_MODULE_NAME, "Performing memory initialization test");
                sys_log_new_line();

                uint8_t data = 0xAA;
                uint8_t check = 0;

                for(int i = 0; i < 4; i++)
                {
					sys_media_write(MEDIA_ENVM, i, &data, 1);
					sys_media_read(MEDIA_ENVM, i, &check, 1);
                }
                
                if(data != check)
                {
                    sys_log_print_event_from_module(SYS_LOG_ERROR, SYS_MEDIA_MODULE_NAME, "Initialization test failed!");
                    sys_log_new_line();
                    return -1;
                }
            #endif /* CONFIG_EXT_SDRAM_TEST_ENABLED */
            return 0;

        case MEDIA_ESRAM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, SYS_MEDIA_MODULE_NAME, "Initialization not implemented for the eSRAM memory!");
            sys_log_new_line();
            return -1;

        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, SYS_MEDIA_MODULE_NAME, "Invalid storage media to initialize!");
            sys_log_new_line();
            return -1;
    }
}

int sys_media_write(media_t med, uint32_t addr, uint8_t *data, uint16_t len)
{
    switch(med)
    {
        case MEDIA_ENVM:
            return NVM_write((MEDIA_ENVM_START_ADDR + addr), data, len, NVM_DO_NOT_LOCK_PAGE);

        case MEDIA_ESRAM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, SYS_MEDIA_MODULE_NAME, "Write operation not implemented for the eSRAM memory!");
            sys_log_new_line();
            return -1;

        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, SYS_MEDIA_MODULE_NAME, "Invalid storage media to write!");
            sys_log_new_line();
            return -1;
    }
}

int sys_media_read(media_t med, uint32_t addr, uint8_t *data, uint16_t len)
{
    switch(med)
    {
        case MEDIA_ENVM:
            addr += MEDIA_ENVM_START_ADDR;
            
            if(addr >= MEDIA_ENVM_END_ADDR)
            {
                addr = MEDIA_ENVM_START_ADDR;
            }

            while(len > 0) 
            {
                *data++ = *(volatile uint8_t *)(addr);
                addr++;
                len--;
            }

            return 0;

        case MEDIA_ESRAM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, SYS_MEDIA_MODULE_NAME, "Read operation not implemented for the eSRAM memory!");
            sys_log_new_line();
            return -1;

        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, SYS_MEDIA_MODULE_NAME, "Invalid storage media to read!");
            sys_log_new_line();
            return -1;
    }
}


/** \} End of sys_media group */
