global ft_list_sort

section .text

ft_list_sort:

	push rbx
	push r12
	push r13
	push r14
	push r15

	test rdi, rdi
	je .end

	test rsi, rsi
	je .end

	mov rbx, rdi
	mov r12, rsi ; function

	mov r13, [rbx] ; current
	test r13, r13
	je .end

.loop:
	mov r14, [r13 + 8] ; current->next
	test r14, r14
	je .end

	mov rdi, [r13]
	mov rsi, [r14]
	call r12

	cmp eax, 0
	jg .swap

	mov r13, [r13 + 8]
	jmp .loop

.swap:
	mov rax, [r13]
	mov r15, [r14]
	mov [r13], r15
	mov [r14], rax

	mov r13, [rbx]
	jmp .loop

.end:
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx

	ret