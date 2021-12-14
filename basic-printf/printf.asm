extern printf

section .data
    format:    db "num: %d",10,0

section .text
	global _start

_start:
    call printf_num

    mov byte [printf_num+1], 0xa

    call printf_num
    
    mov eax, 1           ; sys_exit
	mov ebx, 0           ; return code 0
    int 80h              ;

printf_num:
    push 8
    push format
    call printf
    add esp, 8
    ret
