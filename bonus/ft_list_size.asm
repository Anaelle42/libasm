global ft_list_size

section .text

ft_list_size:
	xor eax, eax

.loop:
	test rdi, rdi
	je .end

	inc eax
	mov rdi, [rdi + 8]
	jmp .loop

.end:
	ret