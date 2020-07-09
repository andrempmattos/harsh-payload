/*
 * obc_interface.c
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
 * \brief OBC communication interface task implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.41
 * 
 * \date 21/05/2020
 * 
 * \addtogroup obc_interface
 * \{
 */

#include <app/includes/fsp_0.2.0/fsp/fsp.h>

#include <system/sys_log/sys_log.h>
#include <devices/obc/obc.h>

#include "obc_interface.h"

xTaskHandle xTaskOBCInterfaceHandle;

/* Local functions prototypes used to process and generate packages using the FSP library */
void send_obc_package(uint8_t *package);
int process_obc_package(obc_command_t *command);

void vTaskOBCInterface(void *pvParameters)
{
    while(1)
    {
    	/* This binary semaphore is used to wait for the interrupt event release. 
    	The task blocks indefinitely, meaning this function call will only return 
    	once the semaphore has been successfully obtained.*/
		xSemaphoreTake(xBinarySemaphore, portMAX_DELAY);
		
		/* To get here the event must have occurred. */
        obc_command_t obc_command;
        obc_data_package_t obc_data;
        sys_state_package_t sys_state;
        
        if (process_obc_package(&obc_command) == 0)
        {
            switch(obc_command.fsp_command) 
            {
                case FSP_CMD_SEND_DATA:
                    if (xQueueReceive(xQueueOBCData, &obc_data, 0) == pdPASS) 
                    {
                        /* Succeed to receive the message, then send the OBC data package */
                        send_obc_package((uint8_t *)&obc_data);
                        
                        sys_log_print_event_from_module(SYS_LOG_INFO, TASK_OBC_INTERFACE_NAME, "Data package sent to OBC");
                        sys_log_new_line();
                    }
                    else 
                    {
                        sys_log_print_event_from_module(SYS_LOG_ERROR, TASK_OBC_INTERFACE_NAME, "Error sending data package!");
                        sys_log_new_line();
                    }
                    break;
                case FSP_CMD_SEND_STATE:
                    if (xQueueReceive(xQueueSystemState, &sys_state, 0) == pdPASS) 
                    {
                        /* Succeed to receive the message, then set current remaining data packages capable to be read */
                    	sys_state.data_packages_count = QUEUE_OBC_DATA_SIZE - uxQueueSpacesAvailable(xQueueOBCData);

                        /* Next, send the OBC state package */
                        send_obc_package((uint8_t *)&sys_state);

                        sys_log_print_event_from_module(SYS_LOG_INFO, TASK_OBC_INTERFACE_NAME, "State package sent to OBC");
                        sys_log_new_line();
                    }
                    else 
                    {
                        sys_log_print_event_from_module(SYS_LOG_ERROR, TASK_OBC_INTERFACE_NAME, "Error sending state package!");
                        sys_log_new_line();
                    }
                    break;
                case FSP_CMD_SET_CONFIG:
                    /* Send to queue the command package */
                    xQueueSendToBack(xQueueOBCCommand, &obc_command.parameter, 0);

                    sys_log_print_event_from_module(SYS_LOG_INFO, TASK_OBC_INTERFACE_NAME, "Valid command package received");
                    sys_log_new_line();
                    break;
                default:
                    sys_log_print_event_from_module(SYS_LOG_WARNING, TASK_OBC_INTERFACE_NAME, "Invalid command received");
                    sys_log_new_line();
            }
        }
        else
        {
            sys_log_print_event_from_module(SYS_LOG_ERROR, TASK_OBC_INTERFACE_NAME, "Failure to process the OBC command package!");
            sys_log_new_line();
        }
    }
}

/**
 * \brief Send OBC package using the FSP protocol.
 *
 * \param[in] package is the buffer used to store the useful data (payload slot in the FSP protocol).
 *
 * \return None.
 */
void send_obc_package(uint8_t *package) 
{
    /* Create FSP data structure buffer */
    fsp_packet_t fsp_data;

    /* Create buffer to transfer the actual data in the SPI burst */    
    uint8_t obc_pkt_data[FSP_PKT_MAX_LENGTH];
    uint8_t obc_pkt_data_len;

    fsp_init(FSP_ADR_HARSH);

    /* Use the "package" buffer parameter as bytes to fill the FSP payload parameter */
    fsp_gen_data_pkt(package, sizeof(package), FSP_ADR_OBDH, FSP_PKT_WITHOUT_ACK, &fsp_data);
    
    /* Set the transfer buffer data with the complete fsp_data buffer data */
    fsp_encode(&fsp_data, obc_pkt_data, &obc_pkt_data_len);

    /* Send the complete package to the OBC */
    obc_send(obc_pkt_data, obc_pkt_data_len);
}

/**
 * \brief Process OBC package using the FSP protocol.
 *
 * \param[out] command is the buffer to store the received command and its parameters.
 *
 * \return The status/error code.
 */
int process_obc_package(obc_command_t *command) 
{
    uint8_t obc_package[FSP_PKT_MAX_LENGTH];
    uint8_t fsp_status = 0;
    uint8_t i = 0;
    fsp_packet_t fsp_packet;

    /* Read the received package */
    obc_read(obc_package);

    /* Init this FSP interface before start communication */
    fsp_init(FSP_ADR_HARSH);

    /* Decode the received obc_package to set the output in the fsp_packet */
    do 
    { 
        fsp_status = fsp_decode(obc_package[i++], &fsp_packet);
    } while(fsp_status == FSP_PKT_NOT_READY);

    /* Check if the decodification generated errors */
    if (fsp_status != FSP_PKT_READY) 
    {
        /* Invalid package, wrong address or critical error occurred */
        sys_log_print_event_from_module(SYS_LOG_ERROR, TASK_OBC_INTERFACE_NAME, "FSP package decodification error!");
        sys_log_new_line();
        return -1;
    }

    /* If the received package was correctly decoded, then process the package if valid type */
    if (fsp_packet.type == FSP_PKT_TYPE_CMD_WITH_ACK)
    {
        /* The OBC interface only accepts communication with ACK response after command request */
        fsp_packet_t fsp_packet_ack;
        
        /* Check the received command */
        switch(fsp_packet.payload[0])
        {
            case FSP_CMD_NOP:
                /* No operation, only used for communication handshake tests */
                fsp_gen_ack_pkt(FSP_ADR_OBDH, &fsp_packet_ack);
                break;
            case FSP_CMD_SEND_DATA:
                /* Request a data package cycle from the payload */
                command->fsp_command = FSP_CMD_SEND_DATA;
                fsp_gen_ack_pkt(FSP_ADR_OBDH, &fsp_packet_ack);
                break;
            case FSP_CMD_SEND_STATE:
                /* Request the current state package from the payload */
                command->fsp_command = FSP_CMD_SEND_STATE;
                fsp_gen_ack_pkt(FSP_ADR_OBDH, &fsp_packet_ack);
                break;
            case FSP_CMD_SET_CONFIG:
                /* Set the payload internal experiment configuration */
                for (i = 0; i < fsp_packet.length; i++)
                {
                    *((uint8_t *)(++command)) = fsp_packet.payload[i];
                }
                command->fsp_command = FSP_CMD_SET_CONFIG;
                fsp_gen_ack_pkt(FSP_ADR_OBDH, &fsp_packet_ack);
                break;
            default:
                /* Since there are other commands not used in this Payload/FSP interface, send a not acknowledged response */
                fsp_gen_nack_pkt(FSP_ADR_OBDH, &fsp_packet_ack);
        }
        
        /* Create the actual acknowledge buffer to be sent to the OBC */
        uint8_t pkt[FSP_PKT_MIN_LENGTH];
        uint8_t pkt_len;
        
        /* Encode the acknowledge package in the target buffer */
        fsp_encode(&fsp_packet_ack, pkt, &pkt_len);
        
        /* Send the acknowledge package to the OBC (just after receiving a valid command) */
        obc_send(pkt, pkt_len);

        return 0;
    }
    else 
    {
        /* Invalid FSP package/command type */
        sys_log_print_event_from_module(SYS_LOG_ERROR, TASK_OBC_INTERFACE_NAME, "FSP package command type error!");
        sys_log_new_line();
        return -1;
    }
}

/** \} End of obc_interface group */
