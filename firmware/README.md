<h1 align="center">
	<br>
	HARSH FIRMWARE
	<br>
</h1>

<h4 align="center">Harsh Environment CubeSat Payload firmware embedded in the SoC FPGA processor (ARM Cortex-M3).</h4>

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
    	<img alt="GitHub issues by-label" src="https://img.shields.io/github/issues/andrempmattos/harsh-payload/firmware?style=for-the-badge">
	</a>
    <a href="https://github.com/andrempmattos/harsh-payload/blob/master/firmware/main.c">
        <img src="https://img.shields.io/badge/language-C-green?style=for-the-badge">
    </a>
    <a href="">
		<img src="https://img.shields.io/badge/IDE%20tool-SoftConsole%20v6.0-yellow?style=for-the-badge">
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
  	<a href="#dependencies">Dependencies</a> •
  	<a href="#references">References</a> •
  	<a href="#development">Development</a> •
  	<a href="#notes">Notes</a>
</p>

## Overview

The HARSH Payload firmware is embedded in the SoC FPGA processor (ARM Cortex-M3) and structured above the FreeRTOS operating system. It was designed to run the radiation experiments in the SDRAM memory devices. In order to allow a simple debug session, the code perform logs that are sent through a UART port. The firmware is divided in 6 folders: hal (CMSIS and ARM port), system (some system configurations, such as clocks), freertos (operating system sources), drivers (Microsemi original drivers and the developed SDRAM driver), devices (sources to handle devices, external peripherals and interfaces), and app (application files and libraries). There are 5 available test algorithms: WriteStatic/ReadStatic, MarchC, DynamicStress, DynamicEClassic, and DynamicF. These algorithms are executed due to a scheduler controlled by the OBC and follows a default routine depending on the experiments requirements/constraints/objectives.

## License
The developed firmware is under MIT license. 

## Version
	- Under development: v0.1.0
	- Expected final release: v1.0.0

## Dependencies
	- FreeRTOS v9.0.0
	- CMSIS (sources provided by Microsemi Libero v11.8)
	- Hardware abstraction layers and drivers (sources provided by Microsemi Libero v11.8)
	- FSP v0.2.0 (FloripaSat Protocol provided by SpaceLab)

## References
	- FreeRTOS v9.0.0 - "CORTEX_SmartFusion2_M2S050_SoftConsole" port demo
	- [OBDH2](https://github.com/spacelab-ufsc/obdh2) (On-Board Data Handling 2.0) - SpaceLab UFSC 

## Development
#### Toolchain setup:
	- [Optional] Install Libero v11.7
	- Install SoftConsole v6.0
	- Install PuTTY or any similar serial monitor

#### Compiling and building: [[Tutorial]](https://github.com/tstana/M2S010-MKR-KIT_FirstProj/wiki)
	- Import this folder (firmware) to SoftConsole in the default settings
	- In Project > Properties > C/C++ Build > Environment, add "SC_INSTALL_DIR" variable with the SoftConsole folder
	- In Project > Properties > C/C++ Build > Settings > Tool Settings tab 
		> GNU ARM Cross C Linker > General, add Script files (-T), add 
			../firmware/CMSIS/startup_gcc/debug-in-microsemi-smartfusion2-envm.ld
		> GNU ARM Cross C Compiler > Miscellaneous > Other compiler flags field, add
			--specs=cmsis.specs
		> GNU ARM Cross C Compiler > Includes > Include paths (-I), add 
			../hal
			../hal/arm_cmsis
			../hal/arm_cmsis/startup_gcc
			../hal/arm_port
			../hal/arm_port/CortexM3
			../freertos
			../freertos/include
			../freertos/portable/MemMang
			../freertos/portable/GCC/ARM_CM3
			../system
			../../firmware
	- Apply, close, and build

#### Debugging
	- In Run > Debug Configurations > GDB OpenOCD Debugging 
		> Main tab > Project, name the new configuration
		> Main tab > C/C++ Application, add Debug/firmware.elf
		> Debugger tab > Config options, add 
			--command "set DEVICE M2S010" --file board/microsemi-cortex-m3.cfg
		> Startup tab > Run/Restart Commands, disable the "Pre-run/Restart reset" tick-box
	- Apply and debug

## Notes
Under Development!



