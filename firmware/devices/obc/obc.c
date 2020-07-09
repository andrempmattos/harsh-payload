/*
 * obc.c
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
 * \brief OBC interface implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.42
 * 
 * \date 12/05/2020
 * 
 * \addtogroup obc
 * \{
 */

#include <system/sys_log/sys_log.h>

#include <drivers/mss_pdma/mss_pdma.h>
#include <drivers/mss_i2c/mss_i2c.h>
#include <drivers/mss_spi/mss_spi.h>
#include <drivers/mss_can/mss_can.h>
#include <drivers/mss_uart/mss_uart.h>

#include <app/interrupts/interrupt_handler.h>

#include "obc.h"

int obc_init(void) 
{ 
    MSS_SPI_init(&g_mss_spi0);

    MSS_SPI_configure_slave_mode
    (
        &g_mss_spi0,
        MSS_SPI_MODE0,
        MSS_SPI_BLOCK_TRANSFER_FRAME_SIZE
    );
  
    MSS_SPI_set_slave_block_buffers
    (
        &g_mss_spi0,
        0,
        0,
        slave_rx_buffer,
        sizeof(slave_rx_buffer),
        0
    );

    MSS_SPI_set_cmd_handler
    (
        &g_mss_spi0,
        spi_cmd_interrupt_handler,
        MAX_COMMAND_SIZE
    );
}

void obc_read(uint8_t *package, uint16_t length)
{
    uint8_t i;
    for (i = 0; i < length; i++)
    {
        *(package++) = slave_rx_buffer[i];
    }
}

void obc_send(uint8_t *package, uint8_t package_len)
{
	sys_log_print_event_from_module(SYS_LOG_INFO, OBC_MODULE_NAME, "Sending a data packet...");
	sys_log_new_line();

    /* Set SPI TX buffer content accordingly */
    MSS_SPI_set_slave_block_buffers
    (
        &g_mss_spi0,
        package,
        package_len,
        slave_rx_buffer,
        sizeof(slave_rx_buffer),
        0
    );
}

/** \} End of obc group */