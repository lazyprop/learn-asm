    %define SYSCALL_EXIT 60
    
    global _start
    
    section .data
N:  dd      10
    

    section .text

vecsum:
    ;; args: (8: n), 
    ;; returns rax: sum of [0, n)
    
    mov     rax, 0              ; sum
    mov     rcx, 1              ; counter
    mov     rdx, [rsp+8]       ; n
vecsum_loop:  
    add     rax, rcx
    inc     rcx
    cmp     rcx, rdx
    jne     vecsum_loop
vecsum_exit:    
    ret


_start:
    push    rbp
    mov     rbp, rsp            ; initialize new stack frame
    push    word [N]            ; push the first argument
    call    vecsum              ; returns in rax
    add     rsp, 8              ; remove call arguments from frame
    pop     rbp

    mov     rdi, rax            ; save returned value in rdi
    
_exit:
    mov     rax, SYSCALL_EXIT
    syscall
    

