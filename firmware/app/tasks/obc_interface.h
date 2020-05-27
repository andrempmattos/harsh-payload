/*
 * obc_interface.h
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
 * \brief OBC communication interface task definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.33
 * 
 * \date 21/05/2020
 * 
 * \defgroup obc_interface OBC Interface
 * \ingroup tasks
 * \{
 */

#ifndef OBC_INTERFACE_H_
#define OBC_INTERFACE_H_

#include <FreeRTOS.h>
#include <task.h>
#include <queue.h>
#include <semphr.h>

#include <app/interrupts/interrupt_handler.h>
#include <app/queues/queues.h>

#define TASK_OBC_INTERFACE_NAME                 "OBC_Interface" /**< Task name. */
#define TASK_OBC_INTERFACE_STACK_SIZE           128             /**< Memory stack size in bytes. */
#define TASK_OBC_INTERFACE_PRIORITY             5               /**< Priority. */

/**
 * \brief OBC FSP command.
 */
typedef struct
{
    uint8_t fsp_command;						/**< FSP command. */
    obc_command_package_t parameter;			/**< FSP command parameter. */
} obc_command_t;

/**
 * \brief OBC communication interface task handle.
 */
extern xTaskHandle xTaskOBCInterfaceHandle;

/**
 * \brief OBC communication interface task.
 *
 * \param[in] pvParameters is a value that will passed as the task's parameter.
 *
 * \return None.
 */
void vTaskOBCInterface(void *pvParameters);

#endif /* OBC_INTERFACE_H_ */

/** \} End of obc_interface group */
