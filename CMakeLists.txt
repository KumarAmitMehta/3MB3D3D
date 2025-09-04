cmake_minimum_required(VERSION 3.28.3)
project(pqshield)
set(FIRMWARE_NAME firmware)

add_executable(${FIRMWARE_NAME} src/main.c)

set_target_properties(${FIRMWARE_NAME} PROPERTIES 
    OUTPUT_NAME "firmware"
    SUFFIX ".elf" 
)

if(CMAKE_SYSTEM_PROCESSOR STREQUAL "arm")
    include(cmake/options/arm-m33-options.cmake)
endif()

