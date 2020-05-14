/*
 * ext_sdram.h
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
 * \brief External SDRAM driver definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.13
 * 
 * \date 13/05/2020
 * 
 * \defgroup ext_sdram External SDRAM
 * \ingroup drivers
 * \{
 */

#ifndef EXT_SDRAM_H_
#define EXT_SDRAM_H_

#include <stdint.h>

#define EXT_SDRAM_MODULE_NAME           "SDRAM"

#define EXT_SDRAM_B_START_ADDR		0xA0000000u			/**< External SDRAM memory B start address. */
#define EXT_SDRAM_B_END_ADDR		0xA3FFFFFFu			/**< External SDRAM memory B end address. */
#define EXT_SDRAM_D_START_ADDR		0xA4000000u			/**< External SDRAM memory D start address. */
#define EXT_SDRAM_D_END_ADDR		0xA7FFFFFFu			/**< External SDRAM memory D end address. */
#define EXT_SDRAM_F_START_ADDR		0xA8000000u			/**< External SDRAM memory F start address. */
#define EXT_SDRAM_F_END_ADDR		0xABFFFFFFu			/**< External SDRAM memory F end address. */

#define DUMMY_TEST_VALUE			0xAABBCCDDu			/**< Dummy value for test purposes. */

/**
 * \brief External SDRAM devices types.
 */
typedef enum
{
    EXT_SDRAM_B=0,      	/**< External SDRAM memory B. */
    EXT_SDRAM_D,       		/**< External SDRAM memory D. */
    EXT_SDRAM_F				/**< External SDRAM memory F. */
} sdram_devices_e;

/**
 * \brief External SDRAM type.
 */
typedef uint8_t sdram_device_t;

/**
 * \brief External SDRAM initialization.
 *
 * \param[in] dev is the storage external SDRAM device to initiailize. It can be:
 * \parblock
 *      -\b EXT_SDRAM_B
 *		-\b EXT_SDRAM_D
 *      -\b EXT_SDRAM_F
 *      .
 * \endparblock
 *
 * \return The status/error code.
 */
int sdram_init(sdram_device_t dev);

/**
 * \brief Writes data into a given address of a external SDRAM device.
 *
 * \param[in] dev is the storage external SDRAM device to write. It can be:
 * \parblock
 *      -\b EXT_SDRAM_B
 *		-\b EXT_SDRAM_D
 *      -\b EXT_SDRAM_F
 *      .
 * \endparblock
 *
 * \param[in] addr is the address to write data.
 *
 * \param[in] data is an array of bytes to write.
 *
 * \param[in] len is the number of bytes to write.
 *
 * \return The status/error code.
 */
int sdram_write(sdram_device_t dev, uint32_t addr, uint32_t *data, uint16_t len);

/**
 * \brief Reads data from a given address of a external SDRAM device.
 *
 * \param[in] dev is the storage external SDRAM device to read. It can be:
 * \parblock
 *      -\b EXT_SDRAM_B
 *		-\b EXT_SDRAM_D
 *      -\b EXT_SDRAM_F
 *      .
 * \endparblock
 *
 * \param[in] addr is the address to read.
 *
 * \param[in,out] data is a pointer to store the read data.
 *
 * \param[in] len is the number of bytes to read starting at addr.
 *
 * \return The status/error code.
 */
int sdram_read(sdram_device_t dev, uint32_t addr, uint32_t *data, uint16_t len);

#endif /* EXT_SDRAM_H_ */

/** \} End of ext_sdram group */