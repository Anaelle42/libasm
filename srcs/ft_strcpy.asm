global ft_strcpy

section .text

ft_strcpy:
	xor rcx, rcx

.loop:
	mov al, [rsi + rcx]
	mov [rdi + rcx], al

	cmp al, 0
	je .end

	inc rcx
	jmp .loop

.end:
	mov rax, rdi
	ret