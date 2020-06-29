/*
 * harshlib.c
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
 * \brief Harsh Payload API library implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.1
 * 
 * \date 23/06/2020
 * 
 * \addtogroup harshlib
 * \{
 */

/* Raspberry Pi wrapper inlcude (change the implementations for other devices) */
#include "../harsh_example/rasp_wrapper.c"

/* FloripaSat Protocol include (required in the FloripaSat core missions) */
#include "../harsh_example/fsp_0.2.0/fsp/fsp.h"

/* Harsh API library include (required for defines, data structures and function protypes) */
#include "harshlib.h"

/* Standard integer library (required for integer bytes, halfwords and words) */
#include <stdint.h>

int harsh_init(void) 
{
	/* Keep the payload board and FPGA turned-off until called to execute */
	log_print_event("Initializing payload board: Keeping turned-off");
	gpio_set(HARSH_BOARD_ENABLE_N_PIN);
	gpio_clear(HARSH_FPGA_ENABLE_PIN);
}

int harsh_start(void) 
{
	/* Turn-on the payload board and FPGA */
	log_print_event("Turn-on the payload board and FPGA");
	gpio_clear(HARSH_BOARD_ENABLE_N_PIN);
	gpio_set(HARSH_FPGA_ENABLE_PIN);

	/* Dalay before perform a interface test routine */
    log_print_event("Initializing payload interface test");
	delay_ms(2000);

	/* Create FSP data structure buffers */
    fsp_packet_t fsp_command;
    fsp_packet_t fsp_ack;

    /* Create buffer to transfer the actual data in the SPI communication */    
    uint8_t cmd_package[FSP_PKT_MIN_LENGTH + 1];
    uint8_t cmd_package_len;
    uint8_t ack_package[FSP_PKT_MIN_LENGTH + 1];

    fsp_init(FSP_ADR_OBDH);

    /* Generate a NOP command package and store it in the fsp_command buffer */
    fsp_gen_cmd_pkt(FSP_CMD_NOP, FSP_ADR_HARSH, FSP_PKT_TYPE_CMD_WITH_ACK, &fsp_command);
    
    /* Set the transfer buffer with the complete fsp_command */
	fsp_encode(&fsp_command, cmd_package, &cmd_package_len);

    /* Send the complete package to the HARSH payload */
    spi_send(cmd_package, cmd_package_len);

    delay_ms(100);

    /* Read the received package */
    spi_read(ack_package);

    /* Decode the received obc_package to set the output in the fsp_ack */
    do 
    { 
        fsp_status = fsp_decode(ack_package[i++], &fsp_ack);
    } while(fsp_status == FSP_PKT_NOT_READY);

    /* Check if the decodification generated a valid ACK package */
    if (fsp_status == FSP_PKT_READY)
    {
    	log_print_event("Payload start interface test: Passed!");
    	return 0;
    }
    else
    {
        /* Invalid package, wrong address or critical error occurred */
        log_print_event("Payload start interface test: Failed!");
        return -1;
    }
}

int harsh_stop(void) 
{
	/* Turn-off the FPGA and payload board*/
	log_print_event("Turn-off the payload board and FPGA");
	gpio_clear(HARSH_FPGA_ENABLE_PIN);
	gpio_set(HARSH_BOARD_ENABLE_N_PIN);
}

int harsh_set_config(command_package_t *cmd) 
{
    /* Create FSP data structure buffers */
    fsp_packet_t fsp_command;
    fsp_packet_t fsp_ack;

	/* Create buffer to transfer the actual data in the SPI communication */    
    uint8_t cmd_package[FSP_PKT_MAX_LENGTH];
	uint8_t cmd_package_len;
	uint8_t ack_package[FSP_PKT_MIN_LENGTH + 1];

	/* Set the command buffer parameters */ 
	uint8_t command_payload[8];
	command_payload[0] = FSP_CMD_SET_CONFIG;
	for (i = 1; i < sizeof(command_payload); i++)
    {
        command_payload[i] = *((uint8_t *)cmd++);
    }

    fsp_init(FSP_ADR_OBDH);
  
	/* Generate a set config command package and store it in the fsp_command buffer */
    fsp_gen_data_pkt(command_payload, sizeof(command_payload), FSP_ADR_HARSH, FSP_PKT_TYPE_DATA_WITH_ACK, &fsp_command);

	/* Set the transfer buffer with the complete fsp_command */
	fsp_encode(&fsp_command, cmd_package, &cmd_package_len);

    /* Send the complete package to the HARSH payload */
    spi_send(cmd_package, cmd_package_len);

    delay_ms(100);

    /* Read the received ack package */
    spi_read(ack_package);

    /* Decode the received obc_package to set the output in the fsp_ack */
    do 
    { 
        fsp_status = fsp_decode(ack_package[i++], &fsp_ack);
    } while(fsp_status == FSP_PKT_NOT_READY);

    /* Check if the decodification generated a valid ACK package */
    if (fsp_status == FSP_PKT_READY)
    {
    	log_print_event("Payload set config command: Succeeded!");
    	return 0;
    }
    else
    {
        /* Invalid package, wrong address or critical error occurred */
        log_print_event("Payload set config command: Failed!");
        return -1;
    }
}

int harsh_get_state(state_package_t *state) 
{
	/* Create FSP data structure buffers */
    fsp_packet_t fsp_command;
    fsp_packet_t fsp_ack;
    fsp_packet_t fsp_state;

	/* Create buffer to transfer the actual data in the SPI communication */    
    uint8_t cmd_package[FSP_PKT_MAX_LENGTH];
	uint8_t cmd_package_len;
    uint8_t ack_package[FSP_PKT_MIN_LENGTH + 1];
    uint8_t state_package[FSP_PKT_MAX_LENGTH];

    fsp_init(FSP_ADR_OBDH);

	/* Generate a state command package and store it in the fsp_command buffer */
    fsp_gen_cmd_pkt(FSP_CMD_SEND_STATE, FSP_ADR_HARSH, FSP_PKT_TYPE_CMD_WITH_ACK, &fsp_command);

	/* Set the transfer buffer with the complete fsp_command */
	fsp_encode(&fsp_command, cmd_package, &cmd_package_len);

    /* Send the complete package to the HARSH payload */
    spi_send(cmd_package, cmd_package_len);

    delay_ms(100);

    /* Read the received ack package */
    spi_read(data_package);

    /* Decode the received obc_package to set the output in the fsp_ack */
    do 
    { 
        fsp_status = fsp_decode(data_package[i++], &fsp_ack);
    } while(fsp_status == FSP_PKT_NOT_READY);

    /* Check if the decodification generated a valid ACK package */
    if (fsp_status == FSP_PKT_READY)
    {
    	log_print_event("Payload send state command: Succeeded!");
    }
    else
    {
        /* Invalid package, wrong address or critical error occurred */
        log_print_event("Payload send state command: Failed!");
        return -1;
    }

    /* Read the received state package */
    spi_read(state_package);

    fsp_reset();

    /* Decode the received obc_package to set the output in the fsp_state */
    do 
    { 
        fsp_status = fsp_decode(state_package[i++], &fsp_state);
    } while(fsp_status == FSP_PKT_NOT_READY);

    /* Check if the decodification generated a valid state package */
    if (fsp_status == FSP_PKT_READY)
    {
        log_print_event("Payload state package receive: Succeeded!");

        /* Save received valid state package */
        uint8_t j = 0;
        while (j++ < i)
        {
            *((uint8_t *)state++) = state_package[j];
        }
        return 0;
    }
    else
    {
        /* Invalid package, wrong address or critical error occurred */
        log_print_event("Payload state package receive: Failed!");
        return -1;
    }
}

int harsh_get_data(data_package_t *data) 
{
    /* Create FSP data structure buffers */
    fsp_packet_t fsp_command;
    fsp_packet_t fsp_ack;
    fsp_packet_t fsp_data;

    /* Create buffer to transfer the actual data in the SPI communication */    
    uint8_t cmd_package[FSP_PKT_MAX_LENGTH];
    uint8_t cmd_package_len;
    uint8_t ack_package[FSP_PKT_MIN_LENGTH + 1];
    uint8_t data_package[FSP_PKT_MAX_LENGTH];

    fsp_init(FSP_ADR_OBDH);

    /* Generate a state command package and store it in the fsp_command buffer */
    fsp_gen_cmd_pkt(FSP_CMD_SEND_DATA, FSP_ADR_HARSH, FSP_PKT_TYPE_CMD_WITH_ACK, &fsp_command);

    /* Set the transfer buffer with the complete fsp_command */
    fsp_encode(&fsp_command, cmd_package, &cmd_package_len);

    /* Send the complete package to the HARSH payload */
    spi_send(cmd_package, cmd_package_len);

    delay_ms(100);

    /* Read the received ack package */
    spi_read(data_package);

    /* Decode the received obc_package to set the output in the fsp_ack */
    do 
    { 
        fsp_status = fsp_decode(data_package[i++], &fsp_ack);
    } while(fsp_status == FSP_PKT_NOT_READY);

    /* Check if the decodification generated a valid ACK package */
    if (fsp_status == FSP_PKT_READY)
    {
        log_print_event("Payload send data command: Succeeded!");
    }
    else
    {
        /* Invalid package, wrong address or critical error occurred */
        log_print_event("Payload send data command: Failed!");
        return -1;
    }

    fsp_reset();

    /* Read the received state package */
    spi_read(state_package);

    /* Decode the received obc_package to set the output in the fsp_data */
    do 
    { 
        fsp_status = fsp_decode(data_package[i++], &fsp_data);
    } while(fsp_status == FSP_PKT_NOT_READY);

    /* Check if the decodification generated a valid state package */
    if (fsp_status == FSP_PKT_READY)
    {
        log_print_event("Payload data package receive: Succeeded!");

        /* Save received valid state package */
        uint8_t j = 0;
        while (j++ < i)
        {
            *((uint8_t *)data++) = data_package[j];
        }
        return 0;
    }
    else
    {
        /* Invalid package, wrong address or critical error occurred */
        log_print_event("Payload data package receive: Failed!");
        return -1;
    }
}


/** \} End of harshlib group */

