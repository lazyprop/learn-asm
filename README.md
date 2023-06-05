# Learning Assembly

To build a program, specify `TARGET` to `make` command. Example:
```
make TARGET=hello   # assembles and links
./hello
echo $?             # to check the return code
make clean          # to remove .o files
```

## Resources

- [Programming from the Ground
  Up](https://download-mirror.savannah.gnu.org/releases/pgubook/ProgrammingGroundUp-1-0-booksize.pdf)
  by Jonathan Bartlett
- [x86 and amd64 instruction
  reference](https://www.felixcloutier.com/x86/index.html) by Felix Cloutier
- [x86 Assembly Wikibook](https://en.wikibooks.org/wiki/X86_Assembly)
- [x86 manpages](https://github.com/ttmo-O/x86-manpages) - Generated from
  Felix Cloutier's reference
- [List of syscalls](https://filippo.io/linux-syscall-table/)
- See `man syscall` for calling conventions. See `man syscalls` for a list of
  syscalls. To find the number of a syscall, look at
  `/usr/include/asm/unistd.h`.


