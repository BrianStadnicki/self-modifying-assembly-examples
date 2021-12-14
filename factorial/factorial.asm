extern printf

section .data
    format:    db "num: %d",10,0

section .text
	global _start

_start:
    mov eax, 0x5
    call factorial

    push eax
    push format
    call printf

    mov eax, 1           ; sys_exit
	mov ebx, 0           ; return code 0
    int 80h              ;

factorial:
    push ebp
    mov ebx, eax
factorial_start:
    sub ebx, 1
    cmp ebx, 0
    je factorial_end
    mul ebx
    jmp factorial_start
factorial_end:
    pop ebp
    ret
