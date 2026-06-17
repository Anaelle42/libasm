# libasm

Reimplementation of several standard C library functions in x86-64 Assembly (NASM).

The goal of this project is to learn low-level programming, Linux system calls, memory management, and the System V AMD64 calling convention.

## Mandatory functions

* `ft_strlen`
* `ft_strcpy`
* `ft_strcmp`
* `ft_write`
* `ft_read`
* `ft_strdup`

## Bonus functions

* `ft_atoi_base`
* `ft_list_push_front`
* `ft_list_size`
* `ft_list_sort`
* `ft_list_remove_if`

The bonus part introduces linked lists, structures, and function pointers in assembly.

## Build

```bash
make
```

Build bonus functions:

```bash
make bonus
```