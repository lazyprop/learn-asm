AS=nasm -felf64 -g
CC=ld

vecsum: vecsum.asm
	$(AS) vecsum.asm -o bin/vecsum.o
	$(CC) bin/vecsum.o -o bin/vecsum
