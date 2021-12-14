section .data
	dog:     db 'Dog',10
	dogLen:  equ $-dog
    cat:     db 'Cat',10
    catLen:  equ $-cat

section .text
	global _start

_start:
    call print_animal

    mov byte [print_animal_dog-1], 90h ; nop jmp before print_animal_dog
    mov byte [print_animal_dog-2], 90h ;

    call print_animal

	mov eax, 1           ; instruction
	mov ebx, 0           ; return code 0
    int 80h              ; sys_exit

print_animal:
	mov eax, 4           ; sys_write code
	mov ebx, 1           ; file descriptor
    jmp print_animal_cat ; always print cat

print_animal_dog:
	mov ecx, dog         ; string
	mov edx, dogLen      ; len
    jmp print_animal_write

print_animal_cat:
    mov ecx, cat         ; string
	mov edx, catLen      ; len

print_animal_write:
	int 80h              ; sys_write
    ret
