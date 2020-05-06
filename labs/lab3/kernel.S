.syntax unified
.cpu cortex-m4
//.fpu softvfp
.thumb

.global vtable_kernel
.global __kernel_reset__

.type vtable_kernel, %object
.type __kernel_reset__, %function

.section .interrupt_vector
vtable_kernel:
    .word __stack_start
    .word __kernel_reset__ + 1
    .size vtable_kernel, .-vtable_kernel

.section .rodata
    START_MESSAGE: .asciz "kernel started!\n"
    RESULT_MESSAGE: .asciz "Result value in r0:"

.section .text
__kernel_reset__:
    ldr r0, =START_MESSAGE
    bl dbgput_line

    bl compute

    mov r4, r0

    ldr r0, =RESULT_MESSAGE
    bl dbgput_line

    mov r0, r4
    bl dbgput_num

    end:
    b end
