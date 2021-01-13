<h1 align="center">
	<br>
	HARSH HARDWARE
	<br>
</h1>

<h4 align="center">The Harsh Environment CubeSat Payload was designed to be compatible with the OBDH FloripaSat-II DaughterBoard standard.</h4>

<p align="center">
    <a href="https://github.com/spacelab-ufsc/spacelab#versioning">
        <img src="https://img.shields.io/badge/status-under%20testing-yellow?style=for-the-badge">
    </a>
    <a href="https://github.com/andrempmattos/harsh-payload/releases">
        <img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/andrempmattos/harsh-payload?style=for-the-badge">
    </a>
    <a href="https://github.com/andrempmattos/harsh-payload/releases">
		<img alt="GitHub commits since latest release (by date)" src="https://img.shields.io/github/commits-since/andrempmattos/harsh-payload/latest?style=for-the-badge">
	</a>
	<a href="https://github.com/andrempmattos/harsh-payload/commits/master">
		<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/andrempmattos/harsh-payload?style=for-the-badge">
	</a>
    <a href="">
    	<img alt="GitHub issues by-label" src="https://img.shields.io/github/issues/andrempmattos/harsh-payload/hardware?style=for-the-badge">
	</a>
    <a href="">
		<img src="https://img.shields.io/badge/CAD%20tool-altium%20v19.2-yellow?style=for-the-badge">
	</a>
	<a href="">
		<img src="https://img.shields.io/badge/use-acedemic%20only-orange?style=for-the-badge">
	</a>
	<a href="">
		<img src="https://img.shields.io/badge/license-MIT-red?style=for-the-badge">
	</a>
	<a href="https://github.com/andrempmattos/harsh-payload/tree/master/documentation">
		<img src="https://img.shields.io/badge/for%20more-here-lightgray?style=for-the-badge">
	</a>
</p>

<p align="center">
  	<a href="#overview">Overview</a> •
  	<a href="#license">License</a> •
  	<a href="#version">Version</a> •
  	<a href="#references">References</a> •
  	<a href="#development">Development</a> •
  	<a href="#notes">Notes</a>
</p>

<p align="center">
<img width="50%" src="https://github.com/andrempmattos/harsh-payload/blob/master/documentation/figures/harsh_pcb_top.png">
<img width="49%" src="https://github.com/andrempmattos/harsh-payload/blob/master/documentation/figures/harsh_pcb_bottom.png">
</p>

## Overview

The board features:
- SmartFusion2 SoC FPGA: M2S010-VFG400 (or M2S025-VFG400). It includes ARM Cortex-M3 and several peripherals.
- ISSI SDRAM Memories: IS42S16320B-6TLI, IS42S16320D-7TLI, and IS42S16320F-7TLI.
- Main debug header: external power supply, JTAG, SPI, and UART.
- Auxiliary debug header: SMF2 smart probes and GPIOs.
- Picoblade 15 pins: GPIOs (might be used differently depending on the application).
- Picoblade 6 pins: Alternative JTAG and power supply interface.
- Picoblade 3 pins: CAN interface (fixed due to the CAN transceiver interface).
- Contact connector (FSI-110-03-G-D-AD): power supply, SPI, I2C, and GPIOs (designed for integration with the SpaceLab-FloripaSat-OBDH2)
- Debug LEDs: 2 for power supply status (1V2 and 3V3), 3 for the memories (1 for each), and 1 connected to the FPGA GPIO (Fabric or ARM).
- External Crystals: 12Mhz and 32.768kHz.
- Latch-up monitors: 3 for each memory (controled by the FPGA) and 1 for the entire board (controled by a external source). Note: the default states are all turned on and there are bypass jumpers if necessary.

The power consumption depends on the application and mainly the instantiated blocks, which includes softcore IPs and hardcore peripherals enabled. Some test results running application in the ARM processor with constant access to the SDRAM controller/memories (memory test algorithms) presented consumption of approximately 150mA at 3.3V supply (500mW).

<p align="center">
	<img width="85%" src="https://github.com/andrempmattos/harsh-payload/blob/master/hardware/Diagrams/Architecture_HARSH_Payload.png">
</p>

## License
The developed hardware is under MIT license. 

## Version
	- Under development: v0.1.0
	- Expected final release: v1.0.0

> The hardware versioning was previously done using revisions, which the "Rev. 1.1" corresponds to the git release "v0.1". The current scheme uses the second method to allow version control across all sources, from firmware to hardware.

## References
	- [OBDH2](https://github.com/spacelab-ufsc/obdh2) (On-Board Data Handling 2.0) - SpaceLab UFSC 
	- [Payload-X](https://github.com/spacelab-ufsc/payload-x-firmware) (Payload for radiation experiments) - SpaceLab UFSC 

## Development

#### Manufacture
The folder Output_files contain "ready to go" files: the gerbers and nc_drills for manufacturing the board, the BOM with all required components, and the pick_place file for automated assembly. Some additional files are also avaliable in the folder, which contain several useful files and documents, such as: 3D models, schematics, and layout prints. The [harsh_fabrication_v1.1.zip](https://github.com/andrempmattos/harsh-payload/blob/master/hardware/Output_files/harsh_fabrication_v1.1.zip) is the set of files used for the first board fabrication.

#### Assembly
The board has components that should not be soldered simultaneously. Refer to the documentation.

#### Power-on procedure
The board requires external supply 3.3V (min. 200mA) from the contact connector or the debug interfaces. The following diagram present a simplified diagram of the board power. Refer to the documentation.

<p align="center">
	<img width="70%" src="https://github.com/andrempmattos/harsh-payload/blob/master/hardware/Diagrams/Power_Diagram.png">
</p>

#### Debugging
The debugging is performed through a serial UART port, using as default a baud rate of 115200, 1 stop bit, and no parity bit. The interface uses a log system standard to improve readability.

## Notes

Under Development!