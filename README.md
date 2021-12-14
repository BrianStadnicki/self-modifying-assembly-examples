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
