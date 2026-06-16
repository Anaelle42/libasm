global ft_strcmp

section .text

ft_strcmp:
	xor rcx, rcx

.loop:
	mov al, [rdi + rcx]
	cmp al, [rsi + rcx]
	jne .diff

	cmp al, 0
	je .end

	inc rcx
	jmp .loop

.diff:
	movzx eax, al
	movzx edx, byte [rsi + rcx]
	sub eax, edx
	ret

.end:
	xor eax, eax
	ret