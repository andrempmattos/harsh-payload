<p align="center">
  <img width="15%" src="https://github.com/andrempmattos/harsh-payload/blob/master/documentation/figures/ufsc_logo.png">
  <img width="19%" src="https://github.com/andrempmattos/harsh-payload/blob/master/documentation/figures/um_logo.png">
  <img width="19%" src="https://github.com/andrempmattos/harsh-payload/blob/master/documentation/figures/lirmm_logo.png">
  <img width="19%" src="https://github.com/andrempmattos/harsh-payload/blob/master/documentation/figures/spacelab_logo.png">
</p>
<br>
<h1 align="center">
  HARSH ENVIRONMENT CUBESAT PAYLOAD
</h1>

<h4 align="center">A brief of the project description, objectives, version, organization and acknowledgements.</h4>

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
  <a href="https://github.com/andrempmattos/harsh-payload/issues">
    <img alt="GitHub issues" src="https://img.shields.io/github/issues/andrempmattos/harsh-payload?style=for-the-badge">
  </a>
  <a href="#license">
    <img src="https://img.shields.io/badge/license-mit-lightgray?style=for-the-badge">
  </a>
  <a href="https://spacelab.ufsc.br">
    <img src="https://img.shields.io/badge/sourced%20by-SpaceLab-blue?style=for-the-badge">
  </a>
  <a href="http://www.lirmm.fr/">
    <img src="https://img.shields.io/badge/sourced%20by-LIRMM-red?style=for-the-badge">
  </a>
  <a href="https://github.com/andrempmattos/harsh-payload/tree/master/documentation">
    <img src="https://img.shields.io/badge/for%20more-here-lightgray?style=for-the-badge">
  </a>
</p>

<p align="center">
  	<a href="#overview">Overview</a> •
  	<a href="#license">License</a> •
  	<a href="#versioning">Versioning</a> •
  	<a href="#deployment">Deployment</a> •
  	<a href="#repository-organization">Repository Organizarion</a> •
  	<a href="#acknowledgements">Acknowledgements</a> •
  	<a href="#notes">Notes</a>
</p>

<br>

## Overview

The Harsh Environment CubeSat Payload is the result of a partnership between the Space Technology Research Laboratory (UFSC-Brazil) and the Space Radiation Research Group (LIRMM-France). It was developed by Andre Mattos as part of the undegraduate final thesis. 

The payload was designed to evaluate and test three different manufacture node SDR SDRAM memories in harsh environments. Also, other experiments are performed to analyse the effects in performance of critical paraments in these devices. The board is compatible with the OBDH FloripaSat-II DaughterBoard standard. The following image present an overview of the target CubeSat mission, where the payload harsh is indicated as "Radiation Monitor".

<p align="center">
  <img width="70%" src="https://github.com/andrempmattos/harsh-payload/blob/master/documentation/figures/exploded_view.png">
</p>


## License

This project is open-source and under MIT license, but some files are subjected to specific terms and comercial use might be prohibited. Therefore, the purpose of the open access approach is to support further educational use and non-profitable academic projects.  

## Versioning

The versioning scheme followed try to minimize errors and misunderstandings by synchronizing project stages using releases and presentend simple version and status badges. The main versioning system is the GitHub release feature itself, giving the status badges only a quick overview of the project for external viewers. For example, each source within the firmware follows a vX.Y.Z versioning scheme, in which Z determines minor self contained changes, Y sets relevant amount of changes or important checkpoints, and X major project checkpoints. In this case, the flight version might be a v1.0.0 or higher. As aforesaid, the badges are only used for quick status verification and uses the following structure:

<img src="https://img.shields.io/badge/status-in%20development-red?style=for-the-badge">
<img src="https://img.shields.io/badge/status-under%20testing-yellow?style=for-the-badge">
<img src="https://img.shields.io/badge/status-flight%20ready-green?style=for-the-badge">
<img src="https://img.shields.io/badge/status-in--orbit%20validated-blue?style=for-the-badge">

## Deployment

In order to manufacture, assembly, test, integrate, and run the payload HARSH, it is necessary to follow the "development" section of each directory ([hardware](https://github.com/andrempmattos/harsh-payload/tree/master/hardware#development), [fpga_soc](https://github.com/andrempmattos/harsh-payload/tree/master/firmware#development), [firmware](https://github.com/andrempmattos/harsh-payload/tree/master/fpga_soc#development) and [harshlib](https://github.com/andrempmattos/harsh-payload/tree/master/harshlib#development)).

## Repository Organization

```
documentation: Project detailed info and main document files, diagrams, images and reports.
firmware: Payload firmware sources, including developed and third-part libraries and frameworks.
fpga_soc: System-On-a-Chip FPGA sources, including the HDL sources, synthesis, reports and IDE files.
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




