# compute a^b using a function.

.section .data

.section .text
.global _start


.type pow,@function
pow:
    push %rbp               # push old base pointer
    mov %rsp, %rbp          # set new value of base pointer

    mov 24(%rbp), %rcx      # rcx contains exponent
    mov 16(%rbp), %rbx      # rbx contains base
    mov $1, %rax            # rax contains result
    mov $0, %rdi            # rdi contains counter

powloop_start:
    cmp %rdi, %rcx          # compare counter and exponent
    je powloop_end          # if equal then escape loop

    inc %rdi                # increment counter
    mul %rbx                # rax := rbx * rax
    jmp powloop_start       # unconditional loop

powloop_end:
    mov %rbp, %rsp          # destroy current stack frame
    pop %rbp
    ret

_start:
    # rbx holds a
    # rcx holds b

    mov $3, %rbx
    mov $4, %rcx

    # push arguments
    push %rcx
    push %rbx

    call pow

                            # exit(%rax)
    mov %rax, %rdi          # return the result
    mov $60, %rax           # syscall 60 is exit
    syscall
    

