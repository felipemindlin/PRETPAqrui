GLOBAL cpuVendor
GLOBAL get_seconds
GLOBAL get_minutes
GLOBAL get_hours
GLOBAL get_weekDay
GLOBAL get_monthDay
GLOBAL get_month
GLOBAL get_year
GLOBAL getKey


section .text

%macro enter_func 0
  push rbp
  mov rbp, rsp
%endmacro

%macro leave_func 0
  mov rsp, rbp
  pop rbp
%endmacro

%macro get_RTC_val 1
  xor rax, rax
  xor rdi, rdi
  mov al, 0x0B
  out 70h, al
  in al, 71h 
  or al, 0x04 
  out 71h, al
  mov al, %1
  out 70h, al
  in al, 71h
  mov rdi, rax
%endmacro

cpuVendor:
	push rbp
	mov rbp, rsp

	push rbx

	mov rax, 0
	cpuid


	mov [rdi], ebx
	mov [rdi + 4], edx
	mov [rdi + 8], ecx

	mov byte [rdi+13], 0

	mov rax, rdi

	pop rbx

	mov rsp, rbp
	pop rbp
	ret

get_seconds:
	enter_func
	get_RTC_val 0
	leave_func
  	ret

get_minutes:
	enter_func
	get_RTC_val 2
	leave_func
  	ret

get_hours:
	enter_func
	get_RTC_val 4
	leave_func
  	ret

get_weekDay:
	enter_func
	get_RTC_val 6
	leave_func
  	ret

get_monthDay:
	enter_func
	get_RTC_val 7
	leave_func
  	ret

get_month:
	enter_func
	get_RTC_val 8
	leave_func
  	ret

get_year:
	enter_func
	get_RTC_val 9
	leave_func
  	ret

getKey:
  push rbp
  mov rbp, rsp
  mov rax, 0

  in al, 0x60       ; lee la TECLA PRESIONADA desde el puerto 60h
  movzx eax, al     ; mueve el byte de al a eax y extiende con ceros los 32 bits superiores
  mov rsp, rbp
  pop rbp
  ret

