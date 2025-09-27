ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 0x10000
    RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 0x4000
}

_estack = ORIGIN(RAM) + LENGTH(RAM);
__StackTop = _estack;

SECTIONS
{
    . = 0x0;
    .vectors 0x0 :
    {
        KEEP(*(.vectors))
        KEEP(*(.vtable))
    } > FLASH

    .text : ALIGN(4)
    {
        *(.text*)
    } > FLASH

    .data : ALIGN(4)
    {
        *(.data*)
    } > RAM

    .bss : ALIGN(4)
    {
        *(.bss*)
        *(COMMON)
    } > RAM

    . = ALIGN(8);
}

