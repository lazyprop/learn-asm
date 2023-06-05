# find the maximum in a list of numbers

.data

list:
    # .long reserves a 32-bit buffer
    .long 4, 17, 3, 7, 6, 17, 10, 14, 5, 16

list_end:
    .byte

.text
.global _start

_start:
    # rax stores current number
    # rbx stores largest number yet
    # rdi stores current position in the list

    mov $0, %rbx
    mov $0, %rdi

    # loop start
maxloop_start:
    cmp $10, %rdi
    je maxloop_end              # if at end of list then escape loop

    mov list(, %rdi, 4), %rax   # move current item into rax
    inc %rdi                    # increment counter

    cmp %rbx, %rax
    jle maxloop_start           # if rax <= rbx loop
    mov %rax, %rbx              # else update the current largest value
    jmp maxloop_start           # unconditionally loop

maxloop_end:
                                # rbx now contains the largest value
                                # exit(%rbx)
    mov $60, %rax               # syscall 60 is exit
    syscall





