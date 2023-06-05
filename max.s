# find the maximum value of a list of integers

.section .data

list:
    .long 1, 2, 3, 4, 5, 6, 7, 8, 20, 10

.section .text
.global _start

_start:
    # rbx will contain the index
    # rax will contain the value at current index
    # rdi will contain the currently largest value

    mov $0, %rbx
    mov $0, %rdi

maxloop_start:
    cmp $10, %rbx
    je maxloop_end                  # if end of list, then escape loop

    mov list(, %rbx, 4), %rax       # else mov current value to %rax
                                    # since we're using the value twice
                                    # it is better to have it in a register

    inc %rbx                        # increment counter
    
    cmp %rdi, %rax
    jle maxloop_start               # if current value in smaller then go to the
                                    # next iteration

    mov %rax, %rdi                  # else update the current largest value

    jmp maxloop_start               # unconditional loop

maxloop_end:
                                    # exit(%rdi)
    mov $60, %rax                   # syscall 60 is exit
    syscall

