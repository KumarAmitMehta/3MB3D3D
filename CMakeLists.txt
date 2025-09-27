cmake_minimum_required(VERSION 3.28.3)
project(FlexiFirm)
set(FIRMWARE_NAME firmware)

if (NOT DEFINED TARGET_CPU)
    message(FATAL_ERROR "TARGET_CPU not defined!")
endif()


if(TARGET_CPU STREQUAL "arm-m33")
    add_subdirectory(baremetal/arm-m33)
elseif(TARGET_CPU STREQUAL "arm-m3-qemu")
    add_subdirectory(baremetal/arm-m3)
elseif(TARGET_CPU STREQUAL "x86")
    add_subdirectory(tests)
else()
    message(FATAL_ERROR "Unsupported TARGET_CPU: ${TARGET_CPU}")
endif()

