# x86 self-modifying code examples

Self-modifying code is something there doesn't seem to be much talk about, so here's some basic examples of it!

Current examples:
 - Basic control flow
 - Basic printf
 - Factorial
 - Hello, World!

There's currently only x86 linux examples currently, I may look into windows and llvm in the future.

## Usage

Go into the directory of the code you want to run and execute `../execute.sh code-name`. For example: `../execute.sh factorial`.

## Dependencies

 - nasm
 - ld
 - objcopy
 - objdump
 - libc:i386

## Quirks

If you look at the execute script, you'll notice that it's a bit odd. `ld` has `--omagic` to allow the `.text` section to be written, but that also disables dynamic linking. `objcopy` is used to make the `.text` section writable, but because of a bug, another script from stackoverflow is used to fix it.

The normal method of writing self-modifying code is to allocate your own memory and do a dance where sometimes it's executable and sometimes its writable. That's a pain, so the program just tells the system that `.text` is modifiable through a flag here.

Not all of the code will follow proper calling conventions and have a regular formatting. I'm a reverse engineer, not an assembly programmer.
