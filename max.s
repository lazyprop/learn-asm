# find the maximum value of a list of integers


/*
important note:
---

because our data items are 32 bits widewe want to use 32 bit e.. registers here.
if we use 64 bit registers, the `mov` instruction will copy two values to the register
for example if the first value is 1 and the second value is 7,
mov list(...), %rax copies 0x7000000001 to the register
*/

.section .data

list:
    .long 7, 11, 8, 8, 9, 4, 10, 6, 16, 18

.section .text
.global _start

_start:
    # ebx will contain the index
    # eax will contain the value at current index
    # edi will contain the current largest value

    mov $0, %ebx
    mov $0, %edi

maxloop_start:
    cmp $10, %ebx
    je maxloop_end                  # if end of list, then escape loop

    mov list(, %ebx, 4), %eax       # else mov current value to %eax
                                    # since we're using the value twice
                                    # it is better to have it in a register

    inc %ebx                        # increment counter
    
    cmp %edi, %eax
    jle maxloop_start               # if current value in smaller then go to the
                                    # next iteration

    mov %eax, %edi                  # else update the current largest value

    jmp maxloop_start               # unconditional loop

maxloop_end:
                                    # exit(%edi)
    mov $60, %eax                   # syscall 60 is exit
    syscall

