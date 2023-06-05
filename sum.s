.section .data

list:
    .long 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.section .text
.global _start

_start:
    # rdi will contain the partial sum
    # rbx will contain the index

    mov $0, %rbx
    mov $0, %rdi

sumloop_start:
    cmp $10, %rbx
    je sumloop_end                  # if end of list, then escape loop

                                    # else add current value to rdi
    mov list(, %rbx, 4), %rax
    add %rax, %rdi
    inc %rbx                        # increment counter
    jmp sumloop_start               # unconditional loop

sumloop_end:
                                    # exit(%rdi)
    mov $60, %rax                   # syscall 60 is exit
    syscall

