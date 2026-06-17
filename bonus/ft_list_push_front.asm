extern malloc
global ft_list_push_front

section .text

ft_list_push_front:
	test rdi, rdi
	je .end

	push rbx
	push rsi

	mov rbx, rdi

	mov rdi, 16
	call malloc

	pop rsi

	test rax, rax
	jz .restore

	mov [rax], rsi		; new->data

	mov rcx, [rbx]
	mov [rax + 8], rcx	; new->next

	mov [rbx], rax		; *begin_list = new

.restore:
	pop rbx

.end:
	ret