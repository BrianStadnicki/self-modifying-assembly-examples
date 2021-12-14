section .data
	hello:     db 'Hello world!',10 
	helloLen:  equ $-hello

section .text
	global _start

_start:
	call print_hello

	mov al, byte [print_hello+11]  ; increment start of hello string
	add eax, 1
	mov byte [print_hello+11], al

    call print_hello

	mov eax, 1           ; instruction
	mov ebx, 0           ; return code 0
    int 80h              ; sys_exit

print_hello:
	mov eax, 4           ; sys_write code
	mov ebx, 1           ; file descriptor
	mov ecx, hello       ; string
	mov edx, helloLen    ; len
	int 80h              ; sys_write
    ret
