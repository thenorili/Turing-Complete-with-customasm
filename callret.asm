#include "leg06.asm"

init: ; root
    mov sp, #0xFF   ; initialize the stack
    mov fp, sp
    sub sp, sp, #16 ; buffer to pad overflows
    mov lr, #exit   ; unsure about the syntax here
    jmp #main
exit:
    mov sp, fp      ; reset the stack
;;; i didn't put any interrupts into this computer how do i make it stop
    mov out, #1

main: ; branch
    ; branch prologue
    push lr      ; pushing the link register to the stack
    push fp      ; pushing the frame pointer to the stack
    mov fp, sp   ; setting up the stack frame
    ; local vars in the 'argument/rv' range
    mov r0, #1
    mov r1, #4
    ; I think that what x86 does is that branching creates an implicit label on the next line
    ; that gets pushed to the link register when you call.
    ; I'm not *certain* that's what arm's b1 does but it'd make sense... even if you can read
    ; from the program counter it seems really inefficient to do so.
    mov lr, #main1
    jmp #max
main1:
    mov sp, fp      ; restore the stack to the state it entered in
    pop fp
    pop lr
    jmpr lr          ; amd would pop directly to PC, i removed that from the GPRs for space

max: ; leaf
    ; leaf prologue
    push fp        ; save the frame pointer to the stack
    add fp, sp, #0 ; set up the bottom of the stack frame
    sub sp, sp, #12
    ; if r0 < r1, jmp to exit and return r0; else, r0 := r1
    jgt #max_out, r0, r1 
    mov r0, r1
max_out:
    ; epilogue
    mov sp, fp  ; restore the stack pointer
    pop fp      ; restore the frame pointer
    ; FIXME: jumping to registers isn't currently supported.
    ; There's no immediate bit for conditions,
    ; so it's assumed the jump target is always a constant.
    ; Previously I had the PC addressable, so I could
    ; jmp and conditionally mov from register to PC.
    ; being able to jmp *to* a register means...
    ; three sources, and i only have two.
    jmpr lr


