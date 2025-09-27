add_executable(${FIRMWARE_NAME}
    src/main.c
    src/arm_startup.c
)

set_target_properties(${FIRMWARE_NAME} PROPERTIES
    OUTPUT_NAME "firmware"
    SUFFIX ".elf"
)

include(${CMAKE_SOURCE_DIR}/cmake/options/arm-m33-options.cmake)

