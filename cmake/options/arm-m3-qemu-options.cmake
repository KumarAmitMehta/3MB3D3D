target_link_options(${FIRMWARE_NAME} PRIVATE
    -T${CMAKE_SOURCE_DIR}/baremetal/arm-m3/src/link.ld
    -nostdlib
    -Wl,-Map=${FIRMWARE_NAME}.map
)

target_compile_options(${FIRMWARE_NAME} PRIVATE
    -W -Wall -Wextra -Werror -Wundef
    -mcpu=cortex-m3
    -mthumb 
)

add_custom_command(TARGET ${FIRMWARE_NAME}
    POST_BUILD
    COMMAND arm-none-eabi-objcopy -O binary $<TARGET_FILE:${FIRMWARE_NAME}> ${FIRMWARE_NAME}.bin
    COMMAND arm-none-eabi-objcopy -O ihex $<TARGET_FILE:${FIRMWARE_NAME}> ${FIRMWARE_NAME}.hex
    BYPRODUCTS ${CMAKE_BINARY_DIR}/${FIRMWARE_NAME}.bin 
        ${CMAKE_BINARY_DIR}/${FIRMWARE_NAME}.hex
        ${CMAKE_BINARY_DIR}/${FIRMWARE_NAME}.map

)

