GLOBAL test

section .text

test:
mov rdi, 1
mov rsi, msg
mov rdx, len
mov rcx, 2
int 80h
ret


section .data
msg db "TEST123", 10, 0
len equ $-msg 
