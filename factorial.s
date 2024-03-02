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

    push %rbx               # save n. it will be lost in the function call
    dec %rbx                # we pass (n-1) to function call
    push %rbx               # push argument for function call
    call factorial

    mov 8(%rsp), %rbx       # retrieve saved value of rbx := n
    mul %rbx                # %rax := %rax * %rbx

    jmp factorial_ret       # return

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
