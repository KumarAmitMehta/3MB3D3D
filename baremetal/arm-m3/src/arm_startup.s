.syntax unified
.cpu cortex-m3
.thumb

.section .vectors, "a", %progbits
.align 2
.extern __StackTop
.global Reset_Handler

.word __StackTop
.word Reset_Handler
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0

.text
.thumb_func
.global Reset_Handler
Reset_Handler:
    bl main
LoopForever:
    b LoopForever

