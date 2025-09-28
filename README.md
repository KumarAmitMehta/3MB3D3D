# Bare Metal Programming with CMake

## Overview
This project demonstrates how to organize a bare metal microcontroller firmware project using CMake.  
It is *not* intended for building complex firmware with many dependencies, but rather to show how  
to structure a CMake-based firmware development environment that can be extended to support  
multiple target platforms in the future.

---

## Directory Structure
- `cmake/`             CMake helper scripts and toolchains.  
- `build/`             Build output directory.  
- `baremetal/`         Baremetal firmware source code(s).  
- `tests/`             Hosted environment for unit tests.  
- `CMakeLists.txt`     Main CMake configuration.  
- `CMakePresets.json`  CMake presets for targets and build types.  
- `mk.sh`              Bash script wrapper for cmake preset commands.  
- `install_deps.sh`    Bash script for installing dependencies for baremetal firmware development.  
- `LICENSE`            License from the original bare metal guide.  
- `README.txt`         This file.  

---

## Features
- Supports following target platforms:  
  a) ARM Cortex-M33: Targeting actual STM32 based development board.  
  b) ARM Cortex-M3: QEMU emulated target.  
  c) x86_64: Hosted environment for code coverage and unit tests.  
- Separate configure and build steps with presets.  
- Multiple branches:  
  a) `baremetal`: No operating system abstraction.  
  b) `zephyr`: zephyr operating system abstraction.  

---

## Requirements
- CMake 3.19+  
- GNU Arm Embedded Toolchain (`arm-none-eabi-gcc`)  
- Make build tool  

---

## Customization
- Add toolchains in `cmake/toolchains/`  
- Extend `CMakePresets.json` for targets/configs  

---

## mk.sh Usage
```
Usage: ./mk.sh [command] [preset]

Commands:
list-configure         List configure presets

```
configure <preset>     Run 'cmake --preset <preset>'
```
list-build             List build presets
```

build <preset>         Run 'cmake --build --preset <preset>'
```

Examples:
./mk.sh list-configure
./mk.sh configure arm-m33-release
./mk.sh list-build
./mk.sh build arm-m33-release-build
```

---

## TODO 
- Refer issues page.
