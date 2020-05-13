/*
 * media.c
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
 * \brief Media device implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.12
 * 
 * \date 13/05/2020
 * 
 * \addtogroup media
 * \{
 */

#include <system/sys_log/sys_log.h>

#include <drivers/mss_nvm/mss_nvm.h>
#include <drivers/mss_sram/mss_sram.h>
#include <drivers/ext_sdram/ext_sdram.h>

#include "media.h"

int media_init(media_t med)
{
    switch(med)
    {
        case MEDIA_ENVM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Initialization not implemented for the eNVM memory!");
            sys_log_new_line();

            return -1;
        case MEDIA_ESRAM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Initialization not implemented for the eSRAM memory!");
            sys_log_new_line();

            return -1;
        case MEDIA_SDRAM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Initialization not implemented for the SDRAM memory!");
            sys_log_new_line();

            return -1;
        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Invalid storage media to initialize!");
            sys_log_new_line();

            return -1;
    }
}

int media_write(media_t med, uint32_t addr, uint32_t *data, uint16_t len)
{
    switch(med)
    {
        case MEDIA_ENVM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Write operation not implemented for the eNVM memory!");
            sys_log_new_line();

            return -1;
        case MEDIA_ESRAM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Write operation not implemented for the eSRAM memory!");
            sys_log_new_line();

            return -1;
        case MEDIA_SDRAM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Write operation not implemented for the SDRAM memory!");
            sys_log_new_line();

            return -1;
        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Invalid storage media to write!");
            sys_log_new_line();

            return -1;
    }
}

int media_read(media_t med, uint32_t addr, uint32_t *data, uint16_t len)
{
    switch(med)
    {
        case MEDIA_ENVM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Read operation not implemented for the eNVM memory!");
            sys_log_new_line();

            return -1;
        case MEDIA_ESRAM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Read operation not implemented for the eSRAM memory!");
            sys_log_new_line();

            return -1;
        case MEDIA_SDRAM:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Read operation not implemented for the SDRAM memory!");
            sys_log_new_line();

            return -1;
        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, MEDIA_MODULE_NAME, "Invalid storage media to read!");
            sys_log_new_line();

            return -1;
    }
}


/** \} End of media group */