.data

.text
.global _start

_start:
                        # exit(0)
    mov $60, %rax       # syscall 60 is exit
    mov $0, %rdi        # we want to return 0
    syscall
