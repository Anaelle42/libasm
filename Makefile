NAME = libasm.a
BONUS_NAME = libasm_bonus.a

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

BONUS_DIR = bonus
BONUS_SRCS =	ft_list_size.asm \
				ft_list_push_front.asm \
				ft_list_sort.asm \
				ft_list_remove_if.asm

OBJS = $(addprefix $(SRCS_DIR)/,$(SRCS:.asm=.o))
BONUS_OBJS = $(addprefix $(BONUS_DIR)/,$(BONUS_SRCS:.asm=.o))

all: $(NAME)

bonus: $(BONUS_NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

$(BONUS_NAME): $(OBJS) $(BONUS_OBJS)
	ar rcs $@ $^

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

test: $(BONUS_NAME) main.c libasm.h
	$(CC) $(CFLAGS) main.c $(BONUS_NAME) -o $(TEST)

clean:
	rm -rf $(OBJS) $(BONUS_OBJS)

fclean: clean
	rm -rf $(NAME) $(BONUS_NAME) $(TEST)

re: fclean all

.PHONY : all bonus clean fclean re test