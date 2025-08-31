cmake_minimum_required(VERSION 3.28.3)
project(pqshield)
set(FIRMWARE_NAME firmware)
add_executable(${FIRMWARE_NAME} src/main.c)

if(CMAKE_SYSTEM_PROCESSOR STREQUAL "arm")
    target_sources(${FIRMWARE_NAME} PRIVATE src/arm_startup.c)

    target_link_options(${FIRMWARE_NAME} PRIVATE
        -T${CMAKE_SOURCE_DIR}/src/link.ld
        -nostartfiles -nostdlib
        --specs=nano.specs
        -lc -lgcc
        -Wl,--gc-sections
        -Wl,-Map=${FIRMWARE_NAME}.map
    )

    # Optimizing for space (-Os) leads to compiler generating
    # memset, memcpy as replacement for copying data.
    target_compile_options(${FIRMWARE_NAME} PRIVATE
        -W -Wall -Wextra -Werror -Wundef -Wshadow -Wdouble-promotion
        -Wformat-truncation -fno-common -Wconversion
        -g3 -O0 -ffunction-sections -fdata-sections -I.
        -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16
    )
endif()

