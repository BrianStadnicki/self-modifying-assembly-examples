extern printf

section .data
    format:    db "num: %d",10,0

section .text
	global _start

_start:
    mov dword [factorial+2], 0x5 ; start number
    
    call factorial
    ; print result
    push eax
    push format
    call printf
    ; exit
    mov eax, 1
	mov ebx, 0
    int 80h

factorial:
    push ebp
    mov eax, 0

    mov ebx, eax
    sub ebx, 1
    mov dword [factorial_start+1], ebx ; init decrementer
    mov ebx, 0

factorial_start:
    ; multiply
    mov ebx, 0
    mul ebx

    ; decrement
    dec dword [factorial_start+1]
    ; exit if at 0
    ; could exit at 1, but then it doesn't handle 0x2
    cmp ebx, 1
    je factorial_end
    ; loop back
    jmp factorial_start

factorial_end:
    pop ebp
    ret
