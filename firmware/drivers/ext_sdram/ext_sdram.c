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
 * \version 0.0.11
 * 
 * \date 13/05/2020
 * 
 * \addtogroup ext_sdram
 * \{
 */

#include <system/sys_log/sys_log.h>

#include "ext_sdram.h"

int sdram_init(media_t med)
{
    
}

void sdram_write(media_t med, uint32_t addr, uint32_t *data, uint16_t len)
{
    while(len > 0) 
    {
        *(volatile uint32_t *)(addr) = *data++;
        addr = addr + 4;
        len--;
    }    
}

int sdram_read(media_t med, uint32_t addr, uint32_t *data, uint16_t len)
{
    while(len > 0) 
    {
        *data++ = *(volatile uint32_t *)(addr);
        addr = addr + 4;
        len--;
    }    
}


/** \} End of ext_sdram group */