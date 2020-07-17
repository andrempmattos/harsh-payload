/*
 * exp_media.c
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
 * \brief Experiment media device implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.47
 * 
 * \date 13/05/2020
 * 
 * \addtogroup exp_media
 * \{
 */

#include <system/sys_log/sys_log.h>

#include <drivers/ext_sdram/ext_sdram.h>

#include "exp_media.h"

int exp_media_init(media_t med)
{
    switch(med)
    {
        case MEDIA_SDRAM_B:
            return sdram_init(EXT_SDRAM_B);
        
        case MEDIA_SDRAM_D:
            return sdram_init(EXT_SDRAM_D);
        
        case MEDIA_SDRAM_F:
            return sdram_init(EXT_SDRAM_F);
        
        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, EXP_MEDIA_MODULE_NAME, "Invalid storage media to initialize!");
            sys_log_new_line();
            return -1;
    }
}

int exp_media_write(media_t med, uint32_t addr, uint32_t *data, uint16_t len)
{
    switch(med)
    {
        case MEDIA_SDRAM_B:
            return sdram_write(EXT_SDRAM_B, addr, data, len);
        
        case MEDIA_SDRAM_D:
            return sdram_write(EXT_SDRAM_D, addr, data, len);
        
        case MEDIA_SDRAM_F:
            return sdram_write(EXT_SDRAM_F, addr, data, len);

        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, EXP_MEDIA_MODULE_NAME, "Invalid storage media to write!");
            sys_log_new_line();
            return -1;
    }
}

int exp_media_read(media_t med, uint32_t addr, uint32_t *data, uint16_t len)
{
    switch(med)
    {
        case MEDIA_SDRAM_B:
            return sdram_read(EXT_SDRAM_B, addr, (uint32_t *)data, len);
        
        case MEDIA_SDRAM_D:
            return sdram_read(EXT_SDRAM_D, addr, (uint32_t *)data, len);
        
        case MEDIA_SDRAM_F:
            return sdram_read(EXT_SDRAM_F, addr, (uint32_t *)data, len);

        default:
            sys_log_print_event_from_module(SYS_LOG_ERROR, EXP_MEDIA_MODULE_NAME, "Invalid storage media to read!");
            sys_log_new_line();
            return -1;
    }
}


/** \} End of exp_media group */
