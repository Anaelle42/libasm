extern malloc
extern ft_strlen
extern ft_strcpy

global ft_strdup

section .text

ft_strdup:
	push rbx
	mov rbx, rdi

	call ft_strlen
	inc rax	; '\0'

	mov rdi, rax
	call malloc
	test rax, rax
	jz .error

	mov rdi, rax
	mov rsi, rbx
	call ft_strcpy 

	pop rbx
	ret

.error:
	pop rbx
	xor rax, rax
	ret