NAME = libasm.a
TEST = test

CC = gcc
CFLAGS = -Wall -Wextra -Werror
ASM = nasm
ASMFLAGS = -f elf64

SRCS_DIR = srcs
SRCS =	ft_write.asm \
		ft_strlen.asm \
		ft_strcpy.asm \
		ft_strcmp.asm \
		ft_read.asm \
		ft_strdup.asm

OBJS = $(addprefix $(SRCS_DIR)/,$(SRCS:.asm=.o))

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

test: $(NAME) main.c libasm.h
	$(CC) $(CFLAGS) main.c $(NAME) -o $(TEST)

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME) $(TEST)

re: fclean all

.PHONY : all clean fclean re test