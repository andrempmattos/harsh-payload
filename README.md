<h1 align="center">
	<img width="15%" src="https://github.com/andrempmattos/HARSH/blob/master/documentation/figures/ufsc_logo.png">
	<img width="19%" src="https://github.com/andrempmattos/HARSH/blob/master/documentation/figures/um_logo.png">
	<img width="19%" src="https://github.com/andrempmattos/HARSH/blob/master/documentation/figures/lirmm_logo.png">
	<img width="19%" src="https://github.com/andrempmattos/HARSH/blob/master/documentation/figures/spacelab_logo.png">
</h1>

<h4 align="center">A brief of the project description, objectives, version, organization and acknowledgements.</h4>

<p align="center">
    <a href="">
		<img src="https://img.shields.io/badge/version-0.1-lightgreen?style=for-the-badge">
	</a>
    <a href="https://spacelab.ufsc.br">
		<img src="https://img.shields.io/badge/sourced%20by-SpaceLab-blue?style=for-the-badge">
	</a>
	<a href="http://www.lirmm.fr/">
		<img src="https://img.shields.io/badge/sourced%20by-LIRMM-red?style=for-the-badge">
	</a>
	<a href="https://github.com/andrempmattos/HARSH/tree/master/documentation">
		<img src="https://img.shields.io/badge/for%20more-here-lightgray?style=for-the-badge">
	</a>
</p>

<p align="center">
  	<a href="#overview">Overview</a> •
  	<a href="#license">License</a> •
  	<a href="#releases">Releases</a> •
  	<a href="#deployment">Deployment</a> •
  	<a href="#repository-organization">Repository Organizarion</a> •
  	<a href="#acknowledgements">Acknowledgements</a> •
  	<a href="#notes">Notes</a>
</p>

<br>

## Overview

The Harsh Environment CubeSat Payload is the result of a partnership between the Space Technology Research Laboratory (UFSC-Brazil) and the Space Radiation Research Group (LIRMM-France). It was developed by Andre Mattos as part of the undegraduate final thesis. 

The payload was designed to evaluate and test three different manufacture node SDR SDRAM memories in harsh environments. Also, other experiments are performed to analyse the effects in performance of critical paraments in these devices. The board is compatible with the OBDH FloripaSat-II DaughterBoard standard.

## License

This project is open-source and under MIT license, but some files are subjected to specific terms and comercial use might be prohibited. Therefore, the purpose of the open access approach is to support further educational use and non-profitable academic projects.  

## Releases

#### v0.1
```
Hardware:
    - Adding engineering model design
    - Adding engineering model output files
    - Adding the files used in the first fabrication

SoC FPGA:
    - Adding preliminary system design
    - Adding prototype assigments

Firmware:
    - First release
    - Prototype version of the hardware
    - Base version of the firmware (FreeRTOS, watchdog, heartbeat, experiments and log messages)
    - OBC communication interface through SPI using the FSP protocol
    - Preliminary static test algorithm
    - Preliminary memory management
	
Harshlib:
    - Adding preliminary OBC library
    - Adding Raspeberry Pi 3 (Model B) functions wrapper

Documentation:
    - Adding preliminary diagrams and images
```

## Deployment

More info soon!

## Repository Organization

```
documentation: Project detailed info and main document files, diagrams, images and reports.
firmware: Payload firmware sources, including third-part libraries and frameworks and developed proprietary files.
fpga_soc: System-On-a-Chip FPGA sources, including the HDL sources, synthesis outputs, reports and IDE framework files.
hardware: Payload hardware files, including CAD sources, fabrication outputs and auxiliary report. 
harshlib: The library for interfacing the Harsh Payload as the OBC.
```

## Acknowledgements

```
Academic Advisors: Eduardo Bezerra and Luigi Dilillo.
SpaceLab team: Gabriel Mariano Marcelino.
SPACERADGroup team: Lucas Matana Luza (LIRMM).
Universities: Federal University of Santa Catarina (Brazil) and University of Montpellier (France).
```

## Notes

More info in the documentation folder!