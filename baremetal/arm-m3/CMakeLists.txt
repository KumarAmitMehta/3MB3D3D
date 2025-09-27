enable_language(C ASM)

add_executable(${FIRMWARE_NAME}
    src/main.c
    src/arm_startup.s
)

set_target_properties(${FIRMWARE_NAME} PROPERTIES
    OUTPUT_NAME "firmware"
    SUFFIX ".elf"
)

include(${CMAKE_SOURCE_DIR}/cmake/options/arm-m3-qemu-options.cmake)
