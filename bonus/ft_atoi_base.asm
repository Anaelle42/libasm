global ft_atoi_base

section .text

ft_atoi_base:
	test rdi, rdi
	je .invalid
	test rsi, rsi
	je .invalid

	xor rcx, rcx

.check_base:
	mov al, [rsi + rcx]
	test al, al
	je .base_checked
	
	cmp al, '-'
	je .invalid
	cmp al, '+'
	je .invalid
	cmp al, ' '
	je .invalid
	cmp al, 9
	jl .check_duplicate
	cmp al, 13
	jle .invalid

.check_duplicate:
	lea rdx, [rcx + 1]

.dup_loop:
	mov r8b, [rsi + rdx]
	test r8b, r8b
	je .next_char

	cmp al, r8b
	je .invalid ; duplicate

	inc rdx
	jmp .dup_loop

.next_char:
	inc rcx
	jmp .check_base

.base_checked:
	cmp rcx, 2
	jl .invalid

	mov r8d, ecx ; base_len
	mov r9d, 1 ; sign
	xor eax, eax ; result

.skip_spaces:
	mov r10b, [rdi]

	cmp r10b, ' '
	je .skip_one_space
	cmp r10b, 9
	jl .parse_sign
	cmp r10b, 13
	jle .skip_one_space

.parse_sign:
	mov r10b, [rdi]
	
	cmp r10b, '+'
	je .plus
	cmp r10b, '-'
	je .minus

	jmp .convert

.skip_one_space:
	inc rdi
	jmp .skip_spaces

.plus:
	inc rdi
	jmp .parse_sign

.minus:
	neg r9d
	inc rdi
	jmp .parse_sign

.convert:
	mov r10b, [rdi]
	test r10b, r10b
	je .done

	xor rdx, rdx

.find_digit:
	mov r11b, [rsi + rdx]
	test r11b, r11b
	je .done

	cmp r10b, r11b
	je .digit_found

	inc rdx
	jmp .find_digit

.digit_found:
	; result = result * base_len + digit
	imul eax, r8d
	add eax, edx

	inc rdi
	jmp .convert

.invalid:
	xor eax, eax
	ret

.done:
	imul eax, r9d
	ret
