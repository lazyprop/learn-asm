.section .data

list:
    .long 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.section .text
.global _start

_start:
    # edi will contain the partial sum
    # ebx will contain the index

    mov $0, %ebx
    mov $0, %edi

sumloop_start:
    cmp $10, %ebx
    je sumloop_end                  # if end of list, then escape loop

                                    # else add current value to edi
    mov list(, %ebx, 4), %eax
    add %eax, %edi
    inc %ebx                        # increment counter
    jmp sumloop_start               # unconditional loop

sumloop_end:
                                    # exit(%edi)
    mov $60, %eax                   # syscall 60 is exit
    syscall

