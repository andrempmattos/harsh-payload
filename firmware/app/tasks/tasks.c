/* 
 * tasks.c
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
 * \brief Tasks implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.29
 * 
 * \date 08/05/2020
 * 
 * \addtogroup tasks
 * \{
 */

#include <FreeRTOS.h>
#include <task.h>

#include <system/config.h>

#include "tasks.h"
#include "startup.h"
#include "watchdog_reset.h"
#include "heartbeat.h"
#include "experiment_manager.h"
#include "experiment_runner.h"

void create_tasks()
{
    /* Startup task */
#if CONFIG_TASK_STARTUP_ENABLED == 1
    xTaskCreate(vTaskStartup, TASK_STARTUP_NAME, TASK_STARTUP_STACK_SIZE, NULL, TASK_STARTUP_PRIORITY, &xTaskStartupHandle);

    if (xTaskStartupHandle == NULL)
    {
        /* Error creating the startup task */
    }
#endif /* CONFIG_TASK_STARTUP_ENABLED */

    /* Watchdog reset task */
#if CONFIG_TASK_WATCHDOG_RESET_ENABLED == 1
    xTaskCreate(vTaskWatchdogReset, TASK_WATCHDOG_RESET_NAME, TASK_WATCHDOG_RESET_STACK_SIZE, NULL, TASK_WATCHDOG_RESET_PRIORITY, &xTaskWatchdogResetHandle);

    if (xTaskWatchdogResetHandle == NULL)
    {
        /* Error creating the watchdog reset task */
    }
#endif /* CONFIG_TASK_WATCHDOG_RESET_ENABLED */

    /* Heartbeat task */
#if CONFIG_TASK_HEARTBEAT_ENABLED == 1
    xTaskCreate(vTaskHeartbeat, TASK_HEARTBEAT_NAME, TASK_HEARTBEAT_STACK_SIZE, NULL, TASK_HEARTBEAT_PRIORITY, &xTaskHeartbeatHandle);

    if (xTaskHeartbeatHandle == NULL)
    {
        /* Error creating the heartbeat task */
    }
#endif /* CONFIG_TASK_HEARTBEAT_ENABLED */

#if CONFIG_TASK_EXPERIMENT_MANAGER_ENABLED == 1
    xTaskCreate(vTaskExperimentManager, TASK_EXPERIMENT_MANAGER_NAME, TASK_EXPERIMENT_MANAGER_STACK_SIZE, NULL, TASK_EXPERIMENT_MANAGER_PRIORITY, &xTaskExperimentManagerHandle);

    if (xTaskExperimentManagerHandle == NULL)
    {
        /* Error creating the experiment manager task */
    }
#endif /* CONFIG_TASK_EXPERIMENT_MANAGER_ENABLED */

#if CONFIG_TASK_EXPERIMENT_RUNNER_ENABLED == 1
    xTaskCreate(vTaskExperimentRunner, TASK_EXPERIMENT_RUNNER_NAME, TASK_EXPERIMENT_RUNNER_STACK_SIZE, NULL, TASK_EXPERIMENT_RUNNER_PRIORITY, &xTaskExperimentRunnerHandle);

    if (xTaskExperimentRunnerHandle == NULL)
    {
        /* Error creating the experiment runner task */
    }
#endif /* CONFIG_TASK_EXPERIMENT_RUNNER_ENABLED */   

#if CONFIG_TASK_OBC_INTERFACE_ENABLED == 1
    xTaskCreate(vTaskOBCInterface, TASK_OBC_INTERFACE_NAME, TASK_OBC_INTERFACE_STACK_SIZE, NULL, TASK_OBC_INTERFACE_PRIORITY, &xTaskOBCInterfaceHandle);

    if (xTaskExperimentRunnerHandle == NULL)
    {
        /* Error creating the OBC interface task */
    }
#endif /* CONFIG_TASK_OBC_INTERFACE_ENABLED */    

}

/** \} End of tasks group */
