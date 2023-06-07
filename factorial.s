# compute factorial recursively

.section .data

.section .text
.global _start

.type factorial,@function
factorial:
    push %rbp
    mov %rsp, %rbp


    mov 16(%rbp), %rbx       # load n into rbx
    cmp $1, %rbx
    je factorial_basecase

    mov %rbx, %rcx          # make copy of n
    dec %rcx

    push %rbx               # save %rbx. it will be lost in the function call

    push %rcx               # push argument for recursive call
    call factorial

    pop %rcx                # pops off the argument
    pop %rbx

    mul %rbx                # %rax := %rax * %rbx

    jmp factorial_ret

factorial_basecase:
    mov $1, %rax            # fact(1) = 1
    jmp factorial_ret

factorial_ret:
    mov %rbp, %rsp          # destroy current stack frame
    pop %rbp
    ret


_start:
    mov $5, %rbx            # rbx contains n, the input

    push %rbx               # push argument
    call factorial

    mov %rax, %rdi
    mov $60, %rax
    syscall
