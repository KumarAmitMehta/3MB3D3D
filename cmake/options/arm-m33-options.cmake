target_link_options(${FIRMWARE_NAME} PRIVATE
    -T${CMAKE_SOURCE_DIR}/baremetal/arm-m33/src/link.ld
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
    -O0 -ffunction-sections -fdata-sections -I.
    -mcpu=cortex-m33 
    -mthumb
    -mfloat-abi=hard
)

add_custom_command(TARGET ${FIRMWARE_NAME}
    POST_BUILD
    COMMAND arm-none-eabi-objcopy -O binary $<TARGET_FILE:${FIRMWARE_NAME}> ${FIRMWARE_NAME}.bin
    COMMAND arm-none-eabi-objcopy -O ihex $<TARGET_FILE:${FIRMWARE_NAME}> ${FIRMWARE_NAME}.hex
    BYPRODUCTS ${CMAKE_BINARY_DIR}/${FIRMWARE_NAME}.bin 
        ${CMAKE_BINARY_DIR}/${FIRMWARE_NAME}.hex
        ${CMAKE_BINARY_DIR}/${FIRMWARE_NAME}.map

)

