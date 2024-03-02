# Learning Assembly

**Note:** Switching to Intel syntax. Only `vecsum.asm` is up to date right now.

To build a program, e.g `vecsum.asm`
```
make vecsum
bin/vecsum
echo $?             # to check the return code
```

Before exit, every program pushes the result to the top of the stack. Set breakpoint
at `_exit` to inspect.

## Calling Convention

- **Caller saved:** RAX, RCX, RDX
- **Callee saved:** RBX, RDI, RSI, **RBP**, **RSP**
- Push arguments in reverse order

## Resources

### x86 Learning/References

- [NASM Tutorial](https://cs.lmu.edu/~ray/notes/nasmtutorial/) by Ray Toal

- [Programming from the Ground
  Up](https://download-mirror.savannah.gnu.org/releases/pgubook/ProgrammingGroundUp-1-0-booksize.pdf)
  by Jonathan Bartlett
- [x86 and amd64 instruction
  reference](https://www.felixcloutier.com/x86/index.html) by Felix Cloutier
- [x86 Assembly Wikibook](https://en.wikibooks.org/wiki/X86_Assembly)
- [x86 manpages](https://github.com/ttmo-O/x86-manpages) - Generated from
  Felix Cloutier's reference
- See `man syscall` for calling conventions. See `man syscalls` for a list of
  syscalls. To find the number of a syscall, refer to
  `/usr/include/asm/unistd.h`.

### GDB

- [Basic GDB
  Tutorial](http://www.cs.toronto.edu/~krueger/csc209h/tut/gdb_tutorial.html) by Hoa Nguyen
- Use [GDB Enhancement Features](https://github.com/hugsy/gef) for a less
  painful experience.
