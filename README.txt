Bare Metal Programming with CMake

This project shows how to organize a bare metal microcontroller firmware project using CMake.

Directory Structure:
- cmake/             CMake helper scripts and toolchains
- build/             Build output directory
- src/               Firmware source code
- CMakeLists.txt     Main CMake configuration
- CMakePresets.json  CMake presets for targets and build types
- mk.sh              Bash Script wrapper for cmake preset commands
- LICENSE            lincense from the original bare metal guide
- README.txt         This file

Features:
- Supports multiple targets with CMake presets (e.g., ARM Cortex-M33, x86_64)
- Separate configure and build steps with presets

Requirements:
- CMake 3.19+
- GNU Arm Embedded Toolchain (arm-none-eabi-gcc)
- Make build tool

Firmware Development:
- Source code in src/

Customization:
- Add toolchains in cmake/toolchains/
- Extend CMakePresets.json for targets/configs
- Add firmware modules in src/

mk.sh Usage:
Usage: ./mk.sh [command] [preset]

Commands:
  list-configure         List configure presets
  configure <preset>     Run 'cmake --preset <preset>'
  list-build             List build presets
  build <preset>         Run 'cmake --build --preset <preset>'

Examples:
  ./mk.sh list-configure
  ./mk.sh configure arm-m33-release
  ./mk.sh list-build
  ./mk.sh build arm-m33-release-build

TODO:
- Add support for zephyr
- Add google unittests for x86_64 target
