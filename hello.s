.global _start

.data
# initialize data here

hello:
    .ascii "hello, world\n"


.text

/*
_start is a label. the same as 'hello'
a label is just a name for a location in memory
*/
_start:
                        # write(1, hello, 13)
    mov $1, %rax        # syscall 1 in write
    mov $1, %rdi        # file descriptor 1 is stdout. pass it to write
    mov $hello, %rsi    # starting address of string buffer
    mov $13, %rdx       # length of string
    syscall

                        # exit(0)
    mov $60, %rax       # syscall 60 is exit
    mov $0, %rdi        # we want to return 0
    syscall


