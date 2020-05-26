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
 * \version 0.0.31
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

#include "obc.h"

int obc_init() 
{ 
    PDMA_init();
    PDMA->RATIO_HIGH_LOW = 0xFF;
    PDMA_configure
    (
        PDMA_CHANNEL_0,
        PDMA_TO_SPI_0,
        PDMA_LOW_PRIORITY | PDMA_BYTE_TRANSFER | PDMA_INC_SRC_ONE_BYTE,
        PDMA_DEFAULT_WRITE_ADJ
    );

    MSS_SPI_init(&g_mss_spi0);

    MSS_SPI_configure_slave_mode
    (
        &g_mss_spi0,
        MSS_SPI_MODE1,
        MSS_SPI_BLOCK_TRANSFER_FRAME_SIZE
    );
  
    MSS_SPI_set_slave_block_buffers
    (
        &g_mss_spi0,
        0,
        0,
        slave_rx_buffer,
        sizeof(slave_rx_buffer),
        spi_rx_interrupt_handler
    );
}

int obc_read(uint8_t *package)
{
    uint8_t i;
    for (i = 0; i < sizeof(package); i++)
    {
        *package++ = slave_rx_buffer[i];
    }
}

int obc_send(uint8_t *package, uint8_t package_len)
{
    debug_print_event_from_module(SYS_LOG_INFO, OBC_MODULE_NAME, "Sending a data packet...");
    debug_new_line();

    /* Disable SPI channel to set the transfer byte count */
    MSS_SPI_disable(&g_mss_spi0);
    MSS_SPI_set_transfer_byte_count( &g_mss_spi0, package_len );
    
    /* Request to the PDMA a data transference from the package buffer to the SPI TX register */
    PDMA_start
    (
        PDMA_CHANNEL_0,
        package,
        PDMA_SPI0_TX_REGISTER,
        package_len
    );

    /* Enable SPI channel again */
    MSS_SPI_enable(&g_mss_spi0);

    /* Ensure that the data was transfered */
    uint8_t timeout_counter;
    while((!MSS_SPI_tx_done(&g_mss_spi0)) || (timeout_counter++ < SPI_TIMEOUT)) 
    {
        debug_print_event_from_module(SYS_LOG_ERROR, OBC_MODULE_NAME, "Communication interface timeout!");
        debug_new_line();
        return -1;
    }

    return 0;
}

/** \} End of obc group */