// Dmytrii Puzyr, IV-72
// Variant: 7220 mod 5 = 0
// Task: (a + b) / 2 + c!

.syntax unified
.cpu cortex-m4
// .fpu softvfp
.thumb

// Global memory locations.
.global vtable
.global reset_handler
.global __hard_reset__

.type vtable, %object
.type __hard_reset__, %function

vtable:
    .word __stack_start
    .word __hard_reset__+1
    .size vtable, .-vtable

__hard_reset__:
    // Initialize stack here if not initialized yet
    bl lab2
    _loop: b _loop
    .size __hard_reset__, .-__hard_reset__
