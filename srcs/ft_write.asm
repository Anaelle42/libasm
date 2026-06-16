extern __errno_location
global ft_write

section .text

ft_write:
	mov rax, 1	; syscall for write
	syscall

	cmp rax, 0
	jl .error

	ret

.error:
	neg rax		; rax = errno
	push rax

	call __errno_location

	pop rdi
	mov [rax], edi
    mov rax, -1
	ret