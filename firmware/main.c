/*******************************************************************************
 * (c) Copyright 2010-2015 Microsemi SoC Products Group.  All rights reserved.
 *
 * High Performance DMA transfer example
 *
 * Please refer to the file README.txt for further details about this example.
 *
 * SVN $Revision: 7926 $
 * SVN $Date: 2015-10-01 14:59:10 +0530 (Thu, 01 Oct 2015) $
 */
#include "drivers/mss_hpdma/mss_hpdma.h"

/*==============================================================================
  Constants.
 */
#define HPDMA_TRANSFER_SIZE     1024

#define TARGET_MDDR_ADDRESS     0xA0000000u

/*==============================================================================
  Global variables.
 */
/*------------------------------------------------------------------------------
 * The g_buffer_a array is used as the source of PDMA transfers.
 */
uint32_t g_buffer_a[HPDMA_TRANSFER_SIZE];

/*------------------------------------------------------------------------------
 * The g_buffer_b array is used as destination of the PDMA transfers.
 */
uint32_t g_buffer_b[HPDMA_TRANSFER_SIZE];

/*------------------------------------------------------------------------------
 * Transfer complete Status updated by Interrupt routine.
 */
volatile uint8_t  g_xfr_completed;

/*==============================================================================
  Local functions.
 */
static void xfer_complete_handler
(
    hpdma_status_t status
);

static void load_pattern
(
    uint32_t * buffer,
    uint32_t word_size
);

/*==============================================================================
 * main function.
 */
int main(void)
{
    /*
     *  Initialize HPDMA controller.
     */
    MSS_HPDMA_init();

    /* Infinite loop */
    for(;;)
    {
        volatile uint32_t dummy;

        /*
         * Load pattern into g_buffer_a word array.
         */
        load_pattern(g_buffer_a, HPDMA_TRANSFER_SIZE);

        MSS_HPDMA_set_handler(xfer_complete_handler);

        /*
         * Start a HPDMA transfer from g_buffer_a[] to g_buffer_b.
         */
        g_xfr_completed = 0u;
        MSS_HPDMA_start((uint32_t)g_buffer_a,
                        TARGET_MDDR_ADDRESS,
                        HPDMA_TRANSFER_SIZE,
                        HPDMA_TO_DDR);

        /*
         * Wait for the transfer on HPDMA channel 0 to complete.
         */
         while(0u == g_xfr_completed)
         {
            ;
         }

        /*
         * Start a HPDMA transfer from g_buffer_a[] to g_buffer_b.
         */
        g_xfr_completed = 0u;
        MSS_HPDMA_start(TARGET_MDDR_ADDRESS,
                        (uint32_t)g_buffer_b,
                        HPDMA_TRANSFER_SIZE,
                        HPDMA_FROM_DDR);

        /*
         * Wait for the transfer on HPDMA channel 0 to complete.
         */
         while(0u == g_xfr_completed)
         {
            ;
         }

        /*
         * Set a breakpoint on the next line. Adding a watch on the g_buffer_b
         * buffer will show the the content of the buffer change as the HPDMA
         * transfers take place from g_buffer_a to g_buffer_b.
         */
        ++dummy;
    }
}
/*==============================================================================
 * Load bit pattern into buffer passed as parameter. The pattern will change
 * with each call to this function.
 */
static void load_pattern
(
    uint32_t * buffer,
    uint32_t word_size
)
{
    uint32_t i;
    static uint32_t increment = 1;
    for(i = 0; i < word_size; ++i)
    {
        buffer[i] = i + increment;
    }
    ++increment;
}

/*==============================================================================
 * HPDMA transfer complete handler.
 */
static void xfer_complete_handler
(
    hpdma_status_t status
)
{
    /* Transfer has completed */
    g_xfr_completed = 1u;
}
