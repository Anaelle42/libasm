extern free
global ft_list_remove_if

section .text

ft_list_remove_if:

	push rbx
	push r12
	push r13
	push r14
	push r15

	test rdi, rdi
	je .end

	test rdx, rdx
	je .end

	test rcx, rcx
	je .end

	mov rbx, rdi ; t_list **cur
	mov r12, rsi ; data_ref
	mov r13, rdx ; cmp
	mov r14, rcx ; free

.loop:
	mov r15, [rbx]
	test r15, r15
	je .end

	mov rdi, [r15]
	mov rsi, r12
	call r13

	test eax, eax
	je .remove

.next:
	lea rbx, [r15 + 8]
	jmp .loop

.remove:
	mov rax, [r15 + 8]
	mov [rbx], rax

	mov rdi, [r15]
	call r14

	mov rdi, r15
	call free

	jmp .loop

.end:
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx

	ret