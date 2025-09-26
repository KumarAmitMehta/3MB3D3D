cmake_minimum_required(VERSION 3.28.3)
project(pqshield)
set(FIRMWARE_NAME firmware)

add_executable(${FIRMWARE_NAME} src/main.c)

set_target_properties(${FIRMWARE_NAME} PROPERTIES 
    OUTPUT_NAME "firmware"
    SUFFIX ".elf" 
)

if(DEFINED TARGET_CPU)
    if(TARGET_CPU STREQUAL "arm-m33")
        include(cmake/options/arm-m33-options.cmake)
    elseif(TARGET_CPU STREQUAL "arm-m3-simulation")
        include(cmake/options/arm-m3-simulation-options.cmake)
    endif()
endif()

