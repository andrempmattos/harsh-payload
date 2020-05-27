/*
 * algorithms.c
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
 * \brief Experiment algorithms implementation.
 * 
 * \author Lucas Matana <lucas.matana-luza@lirmm.fr> and Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.33
 * 
 * \date 26/05/2020
 * 
 * \addtogroup algorithms
 * \{
 */

#include <devices/media/media.h>

#include "algorithms.h"


void static_write_algorithm(uint8_t *data_package, int memory_device) 
{

}
void static_read_algorithm(uint8_t *data_package, int memory_device) 
{

}
void dynamic_loopc_algorithm(uint8_t *data_package, int memory_device) 
{

}
void dynamic_stress_algorithm(uint8_t *data_package, int memory_device) 
{

}
void dynamic_eclassic_algorithm(uint8_t *data_package, int memory_device) 
{

}
void dynamic_f_algorithm(uint8_t *data_package, int memory_device) 
{

}















/*
 * Variables used in the Lucas algorithms
 *
void MemoryVerify(u32 AddressInitial, u32 AddressFinal, u16 DataInjected) 
{
	u32 i, j;
	u32 ErrorCounter;
	u32 ErrorAddress;
	u32 DataWrite;
	u32 DataRead;
	u32 ErrorData;
	u32 Cycles;
	u32 LineColumn;
	char StopCommand[2] = { '0', '0' };
}
*/











/*
 * ====================================================================================
 * == WRITE STATIC
 * ====================================================================================
	
	xil_printf(
			"Write static 0x%04X from address 0x%06X to address 0x%06X\n\r",
			DataInjected, AddressInitial, AddressFinal - 1);

	for (i = AddressInitial;
			i < (AddressInitial + (AddressFinal - AddressInitial)); i++) {
		if (i == (AddressInitial + (AddressFinal - AddressInitial) - 1))
			DataWrite = 0xF0F0;
		else
			DataWrite = DataInjected;
		RAM_WR(RAM_BASE, i, DataWrite);
	}

*/









/*
 * ====================================================================================
 * == READ STATIC
 * ====================================================================================

	xil_printf(
			"Read static 0x%04X from address 0x%06X to address 0x%06X\n\r",
			DataInjected, AddressInitial, AddressFinal - 1);

	ErrorCounter = 0;
	for (i = AddressInitial;
			i < (AddressInitial + (AddressFinal - AddressInitial)); i++) {
		DataRead = RAM_RD(RAM_BASE, i);
		if (DataRead != DataInjected) {
			ErrorAddress = i;
			ErrorData = DataRead ^ DataInjected;
			ErrorCounter++;
			FormatError(ErrorAddress, ErrorData, 0, 0);
			xil_printf("%s\n\r", ErrorString);
		}
	}
	xil_printf("\nErrors = %u\n\r", ErrorCounter);

*/










/*
 * ====================================================================================
 * == LOOP C-
 * ====================================================================================
 
	xil_printf("Loop C- from address 0x%06X to address 0x%06X\n\r",
			AddressInitial, AddressFinal - 1);

	Cycles = 0;
	ErrorCounter = 0;

	// Write 0x0000 UP
	for (i = AddressInitial;
			i < (AddressInitial + (AddressFinal - AddressInitial)); i++) {
		if (i == (AddressInitial + (AddressFinal - AddressInitial) - 1))
			DataWrite = 0xF0F0;
		else
			DataWrite = 0x0000;
		RAM_WR(RAM_BASE, i, DataWrite);
	}

	StopCommand[0] = '0';

	while (StopCommand[0] != 's') {

		//Verify if there is data in the buffer
		if (XUartPs_IsReceiveData(STDIN_BASEADDRESS)) {
			StopCommand[0] = XUartPs_RecvByte(STDIN_BASEADDRESS); //get command
			StopCommand[1] = XUartPs_RecvByte(STDIN_BASEADDRESS); //get '\r'
		}

		//Read 0x0000 Write 0xFFFF UP
		DataInjected = 0x0000;
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			//Read 0x0000
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0x0000) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x11;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0xFFFF
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 1))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0xFFFF;
			RAM_WR(RAM_BASE, i, DataWrite);
		}

		//Read 0xFFFF Write 0x0000 UP
		DataInjected = 0xFFFF;
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			//Read 0xFFFF
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0xFFFF) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x19;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0x0000
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 2))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0x0000;
			RAM_WR(RAM_BASE, i, DataWrite);
		}

		//Read 0x0000 Write 0xFFFF DOWN
		DataInjected = 0x0000;
		for (i = (AddressInitial + (AddressFinal - AddressInitial) - 1);
				i > AddressInitial; i--) {
			//Read 0x0000
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0x0000) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x21;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0xFFFF
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 3))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0xFFFF;
			RAM_WR(RAM_BASE, i, DataWrite);
		}

		//Read 0xFFFF Write 0x0000 DOWN
		DataInjected = 0xFFFF;
		for (i = (AddressInitial + (AddressFinal - AddressInitial) - 1);
				i > AddressInitial; i--) {
			//Read 0xFFFF
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0xFFFF) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x29;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0x0000
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 4))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0x0000;
			RAM_WR(RAM_BASE, i, DataWrite);
		}

		//Read 0x0000 UP
		DataInjected = 0x0000;
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0x0000) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x31;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}
		}

		Cycles++;
		if (Cycles == 16){
			Cycles = 0;
		}
	}

	xil_printf("\nErrors = %u\n\r", ErrorCounter);

*/












/*
 * ====================================================================================
 * == DYNAMIC Stress
 * ====================================================================================

	xil_printf("Dynamic Stress from address 0x%06X to address 0x%06X\n\r",
			AddressInitial, AddressFinal - 1);

	Cycles = 0;
	ErrorCounter = 0;

	// Write 0xFFFF UP
	for (i = AddressInitial;
			i < (AddressInitial + (AddressFinal - AddressInitial)); i++) {
		if (i == (AddressInitial + (AddressFinal - AddressInitial) - 1))
			DataWrite = 0xF0F0;
		else
			DataWrite = 0xFFFF;
		RAM_WR(RAM_BASE, i, DataWrite);
	}

	StopCommand[0] = '0';

	while (StopCommand[0] != 's') {

		//Verify if there is data in the buffer
		if (XUartPs_IsReceiveData(STDIN_BASEADDRESS)) {
			StopCommand[0] = XUartPs_RecvByte(STDIN_BASEADDRESS); //get command
			StopCommand[1] = XUartPs_RecvByte(STDIN_BASEADDRESS); //get '\r'
		}

		//UP { R1 W0 R0 R0 R0 R0 R0}
		DataInjected = 0xFFFF;
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			//Read 0xFFFF
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0xFFFF) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x11;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0x0000
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 2))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0x0000;
			RAM_WR(RAM_BASE, i, DataWrite);

			//5x Read 0x0000
			DataInjected = 0x0000;
			for (j = 0; j < 5; j++) {
				//Read 0x0000
				DataRead = RAM_RD(RAM_BASE, i);
				if (DataRead != 0x0000) {
					ErrorAddress = i;
					ErrorData = DataRead ^ DataInjected;
					ErrorCounter++;
					LineColumn = 0x13 + j;
					FormatError(ErrorAddress, ErrorData, LineColumn,
							Cycles);
					xil_printf("%s\n\r", ErrorString);
				}
			}
		}

		//UP { R0 W1 R1 R1 R1 R1 R1}
		DataInjected = 0x0000;
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			//Read 0x0000
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0x0000) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x19;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0xFFFF
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 2))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0xFFFF;
			RAM_WR(RAM_BASE, i, DataWrite);

			//5x Read 0xFFFF
			DataInjected = 0xFFFF;
			for (j = 0; j < 5; j++) {
				//Read 0xFFFF
				DataRead = RAM_RD(RAM_BASE, i);
				if (DataRead != 0xFFFF) {
					ErrorAddress = i;
					ErrorData = DataRead ^ DataInjected;
					ErrorCounter++;
					LineColumn = 0x1B + j;
					FormatError(ErrorAddress, ErrorData, LineColumn,
							Cycles);
					xil_printf("%s\n\r", ErrorString);
				}
			}
		}

		//UP { R1 W0 R0 R0 R0 R0 R0}
		DataInjected = 0xFFFF;
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			//Read 0xFFFF
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0xFFFF) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x21;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0x0000
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 2))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0x0000;
			RAM_WR(RAM_BASE, i, DataWrite);

			//5x Read 0x0000
			DataInjected = 0x0000;
			for (j = 0; j < 5; j++) {
				//Read 0x0000
				DataRead = RAM_RD(RAM_BASE, i);
				if (DataRead != 0x0000) {
					ErrorAddress = i;
					ErrorData = DataRead ^ DataInjected;
					ErrorCounter++;
					LineColumn = 0x23 + j;
					FormatError(ErrorAddress, ErrorData, LineColumn,
							Cycles);
					xil_printf("%s\n\r", ErrorString);
				}
			}
		}

		//DOWN { R0 W1 R1 R1 R1 R1 R1}
		DataInjected = 0x0000;
		for (i = (AddressInitial + (AddressFinal - AddressInitial) - 1);
				i > AddressInitial; i--) {
			//Read 0x0000
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0x0000) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x29;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0xFFFF
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 2))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0xFFFF;
			RAM_WR(RAM_BASE, i, DataWrite);

			//5x Read 0xFFFF
			DataInjected = 0xFFFF;
			for (j = 0; j < 5; j++) {
				//Read 0xFFFF
				DataRead = RAM_RD(RAM_BASE, i);
				if (DataRead != 0xFFFF) {
					ErrorAddress = i;
					ErrorData = DataRead ^ DataInjected;
					ErrorCounter++;
					LineColumn = 0x2B + j;
					FormatError(ErrorAddress, ErrorData, LineColumn,
							Cycles);
					xil_printf("%s\n\r", ErrorString);
				}
			}
		}

		//DOWN { R1 W0 R0 R0 R0 R0 R0}
		DataInjected = 0xFFFF;
		for (i = (AddressInitial + (AddressFinal - AddressInitial) - 1);
				i > AddressInitial; i--) {
			//Read 0xFFFF
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0xFFFF) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x31;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0x0000
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 2))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0x0000;
			RAM_WR(RAM_BASE, i, DataWrite);

			//5x Read 0x0000
			DataInjected = 0x0000;
			for (j = 0; j < 5; j++) {
				//Read 0x0000
				DataRead = RAM_RD(RAM_BASE, i);
				if (DataRead != 0x0000) {
					ErrorAddress = i;
					ErrorData = DataRead ^ DataInjected;
					ErrorCounter++;
					LineColumn = 0x33 + j;
					FormatError(ErrorAddress, ErrorData, LineColumn,
							Cycles);
					xil_printf("%s\n\r", ErrorString);
				}
			}
		}

		//UP { R0 W1 R1 R1 R1 R1 R1}
		DataInjected = 0x0000;
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			//Read 0x0000
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0x0000) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x39;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0xFFFF
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 2))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0xFFFF;
			RAM_WR(RAM_BASE, i, DataWrite);

			//5x Read 0xFFFF
			DataInjected = 0xFFFF;
			for (j = 0; j < 5; j++) {
				//Read 0xFFFF
				DataRead = RAM_RD(RAM_BASE, i);
				if (DataRead != 0xFFFF) {
					ErrorAddress = i;
					ErrorData = DataRead ^ DataInjected;
					ErrorCounter++;
					LineColumn = 0x3B + j;
					FormatError(ErrorAddress, ErrorData, LineColumn,
							Cycles);
					xil_printf("%s\n\r", ErrorString);
				}
			}
		}

		Cycles++;
		if (Cycles == 16){
			Cycles = 0;
		}
	}
	xil_printf("\nErrors = %u\n\r", ErrorCounter);

*/

















/*
 * ====================================================================================
 * == DYNAMIC E Classic
 * ====================================================================================

	xil_printf(
			"Dynamic E Classic from address 0x%06X to address 0x%06X\n\r",
			AddressInitial, AddressFinal - 1);

	Cycles = 0;
	ErrorCounter = 0;

	StopCommand[0] = '0';

	while (StopCommand[0] != 's') {

		//Verify if there is data in the buffer
		if (XUartPs_IsReceiveData(STDIN_BASEADDRESS)) {
			StopCommand[0] = XUartPs_RecvByte(STDIN_BASEADDRESS); //get command
			StopCommand[1] = XUartPs_RecvByte(STDIN_BASEADDRESS); //get '\r'
		}

		// Write 0x0000 UP
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 1))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0x0000;
			RAM_WR(RAM_BASE, i, DataWrite);
		}

		//Read 0x0000 UP
		DataInjected = 0x0000;
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0x0000) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x11;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}
		}

		// Write 0xFFFF UP
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 1))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0xFFFF;
			RAM_WR(RAM_BASE, i, DataWrite);
		}

		//Read 0xFFFF DOWN
		DataInjected = 0xFFFF;
		for (i = (AddressInitial + (AddressFinal - AddressInitial) - 1);
				i > AddressInitial; i--) {
			//Read 0xFFFF
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0xFFFF) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x21;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}
		}

		Cycles++;
		if (Cycles == 16){
			Cycles = 0;
		}
	}
	xil_printf("\nErrors = %u\n\r", ErrorCounter);

 */
















/*
 * ====================================================================================
 * == DYNAMIC F
 * ====================================================================================

	xil_printf("Dynamic F from address 0x%06X to address 0x%06X\n\r",
			AddressInitial, AddressFinal - 1);

	Cycles = 0;
	ErrorCounter = 0;

	// Write 0x0000 UP
	for (i = AddressInitial;
			i < (AddressInitial + (AddressFinal - AddressInitial)); i++) {
		if (i == (AddressInitial + (AddressFinal - AddressInitial) - 1))
			DataWrite = 0xF0F0;
		else
			DataWrite = 0x0000;
		RAM_WR(RAM_BASE, i, DataWrite);
	}

	StopCommand[0] = '0';

	while (StopCommand[0] != 's') {

		//Verify if there is data in the buffer
		if (XUartPs_IsReceiveData(STDIN_BASEADDRESS)) {
			StopCommand[0] = XUartPs_RecvByte(STDIN_BASEADDRESS); //get command
			StopCommand[1] = XUartPs_RecvByte(STDIN_BASEADDRESS); //get '\r'
		}

		//Read 0x0000 Write 0xFFFF UP
		DataInjected = 0x0000;
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			//Read 0x0000
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0x0000) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x11;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0xFFFF
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 1))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0xFFFF;
			RAM_WR(RAM_BASE, i, DataWrite);
		}

		//Read 0xFFFF Write 0x0000 UP
		DataInjected = 0xFFFF;
		for (i = AddressInitial;
				i < (AddressInitial + (AddressFinal - AddressInitial));
				i++) {
			//Read 0xFFFF
			DataRead = RAM_RD(RAM_BASE, i);
			if (DataRead != 0xFFFF) {
				ErrorAddress = i;
				ErrorData = DataRead ^ DataInjected;
				ErrorCounter++;
				LineColumn = 0x19;
				FormatError(ErrorAddress, ErrorData, LineColumn, Cycles);
				xil_printf("%s\n\r", ErrorString);
			}

			//Write 0x0000
			if (i == (AddressInitial + (AddressFinal - AddressInitial) - 2))
				DataWrite = 0xF0F0;
			else
				DataWrite = 0x0000;
			RAM_WR(RAM_BASE, i, DataWrite);
		}

		Cycles++;
		if (Cycles == 16){
			Cycles = 0;
		}
	}
	xil_printf("\nErrors = %u\n\r", ErrorCounter);

*/








/*
 * ====================================================================================
 * == LOG FORMAT CONVERTION FUNCTIONS
 * ====================================================================================

void FormatError(u32 Address, u16 Data, u8 LineColumn, u8 Cycle) {
	u8 byte;

	strcpy(ErrorString, "64 ");

	byte = (Cycle << 4) | 0x0;
	ConvertToHex(byte);
	byte = (Address & 0xFF0000) >> 16;
	ConvertToHex(byte);
	byte = (Address & 0x00FF00) >> 8;
	ConvertToHex(byte);
	byte = (Address & 0x0000FF);
	ConvertToHex(byte);
	byte = 0x00;
	ConvertToHex(byte);
	byte = 0x00;
	ConvertToHex(byte);
	byte = (Data & 0xFF00) >> 8;
	ConvertToHex(byte);
	byte = (Data & 0x00FF);
	ConvertToHex(byte);
	ConvertToHex(LineColumn);
}

void ConvertToHex(u8 Data) {
	u8 str[256];

	if (Data == 0)
		strcat(ErrorString, "00");
	else {
		if (Data < 16) {
			strcat(ErrorString, "0");
			sprintf(str, "%X", Data);
			strcat(ErrorString, str);
		} else {
			sprintf(str, "%X", Data);
			strcat(ErrorString, str);
		}
	}
	strcat(ErrorString, " ");
}

*/






/** \} End of algorithms group */
