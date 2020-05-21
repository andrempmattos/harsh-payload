/* 
 * queues.c
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
 * \brief Queues implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.25
 * 
 * \date 18/05/2020
 * 
 * \addtogroup queues
 * \{
 */

#include <system/config.h>

#include "queues.h"

void create_queues()
{
    /* OBC command queue */
#if CONFIG_QUEUE_OBC_COMMAND_ENABLED == 1
    xQueueOBCCommand = xQueueCreate(1, sizeof(obc_command_package_t));

    if (xQueueOBCCommand == NULL)
    {
        /* Error creating the OBC command queue */
    }
#endif /* CONFIG_QUEUE_OBC_COMMAND_ENABLED */

    /* OBC data queue */
#if CONFIG_QUEUE_OBC_DATA_ENABLED == 1
    xQueueOBCData = xQueueCreate(10, sizeof(obc_data_package_t));

    if (xQueueOBCData == NULL)
    {
        /* Error creating the OBC data queue */
    }
#endif /* CONFIG_QUEUE_OBC_DATA_ENABLED */

    /* System state queue */
#if CONFIG_QUEUE_SYS_STATE_ENABLED == 1
    xQueueSystemState = xQueueCreate(5, sizeof(sys_state_package_t));

    if (xQueueSystemState == NULL)
    {
        /* Error creating the system state queue */
    }
#endif /* CONFIG_QUEUE_SYS_STATE_ENABLED */

    /* Experiment command queue */
#if CONFIG_QUEUE_EXPERIMENT_COMMAND_ENABLED == 1
    xQueueExperimentCommand = xQueueCreate(1, sizeof(experiment_command_package_t));

    if (xQueueExperimentCommand == NULL)
    {
        /* Error creating the experiment command queue */
    }
#endif /* CONFIG_QUEUE_EXPERIMENT_COMMAND_ENABLED */

    /* Experiment state queue */
#if CONFIG_QUEUE_EXPERIMENT_STATE_ENABLED == 1
    xQueueExperimentState= xQueueCreate(1, sizeof(experiment_state_package_t));

    if (xQueueExperimentState == NULL)
    {
        /* Error creating the experiment state queue */
    }
#endif /* CONFIG_QUEUE_EXPERIMENT_STATE_ENABLED */

}

/** \} End of queues group */
