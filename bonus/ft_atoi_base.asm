global ft_atoi_base

section .text

ft_atoi_base:
	test rdi, rdi
	je .invalid

	test rsi, rsi
	je .invalid

	xor rcx, rcx

.check_base_loop:
	mov al, [rsi + rcx]
	test al, al
	je .end_string
	
	cmp al, '-'
	je .invalid

	cmp al, '+'
	je .invalid

	cmp al, ' '
	je .invalid

	mov rdx, rcx
	inc rdx

	cmp al, 9
	jl .check_doublon

	cmp al, 13
	jle .invalid

.check_doublon:
	mov r8b, [rsi + rdx]
	test r8b, r8b
	je .next

	cmp al, r8b
	je .invalid ; doublon

	inc rdx
	jmp .check_doublon

.next:
	inc rcx
	jmp .check_base_loop

.end_string:
	cmp rcx, 2
	jl .invalid

	mov r8, rcx ; base_len
	mov r9d, 1 ; sign
	xor rax, rax

.skip_spaces:
	mov r11b, [rdi]

	cmp r11b, ' '
	je .space_next

	cmp r11b, 9
	jl .check_sign

	cmp r11b, 13
	jle .space_next

	jmp .check_sign

.space_next:
	inc rdi
	jmp .skip_spaces

.check_sign:
	mov r11b, [rdi]
	
	cmp r11b, '+'
	je .sign_plus

	cmp r11b, '-'
	je .sign_moins

	jmp .convert

.sign_plus:
	inc rdi
	jmp .check_sign

.sign_moins:
	neg r9d
	inc rdi
	jmp .check_sign

.convert:
	mov r11b, [rdi]
	test r11b, r11b
	je .end

	xor rdx, rdx

.find_digit:
	mov r10b, [rsi + rdx]
	test r10b, r10b
	je .end

	cmp r11b, r10b
	je .digit_found

	inc rdx
	jmp .find_digit

.digit_found:
	; result = result * base_len + digit
	imul rax, r8
	add rax, rdx

	inc rdi
	jmp .convert

.invalid:
	xor eax, eax
	ret

.end:
	imul rax, r9
	ret
