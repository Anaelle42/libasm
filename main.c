#include "libasm.h"

void	ft_lstclear(t_list **lst, void (*del)(void*))
{
	t_list	*ptr;
	t_list	*tmp;

	if (!lst)
		return ;
	ptr = *lst;
	while (ptr)
	{
		tmp = ptr->next;
		if (del)
			del(ptr->data);
		free(ptr);
		ptr = tmp;
	}
	*lst = NULL;
}

void	print_list(t_list *lst, char f)
{
	printf("List: ");
	while (lst)
	{
		if (f == 's')
			printf("%s", (char *)lst->data);
		else
			printf("%i", *(int *)lst->data);
		if (lst->next)
			printf(", ");
		lst = lst->next;
	}
	printf("\n");
}

int	cmp_int(const int *ptr_a, const int *ptr_b)
{
	if (*ptr_a < *ptr_b)
		return (-1);
	if (*ptr_a > *ptr_b)
		return (1);
	return (0);
}

static	int cmp_str(const void *a, const void *b)
{
	return (ft_strcmp((const char *)a, (const char *)b));
}

int	main(void)
{
	char *str;
    char buf[256];
	ssize_t	rv;

	// Mandatory part

    printf("--- ft_strlen ---\n");

    printf("strlen: %zu\n", ft_strlen("Chocolat"));
    printf("ft_strlen: %zu\n", ft_strlen("Hello"));

    printf("\n--- ft_strcpy ---\n");

	ft_strcpy(buf, "Hello World!");
	printf("%s\n", buf);

	ft_strcpy(buf, "pizza");
	printf("%s\n", buf);

    printf("\n--- ft_strcmp ---\n");

	printf("strcmp: %i, ft_strcmp: %i\n", strcmp("abc", "abc"), ft_strcmp("abc", "abc"));
	printf("strcmp: %i, ft_strcmp: %i\n", strcmp("Hello", "World"), ft_strcmp("Hello", "World"));
	printf("strcmp: %i, ft_strcmp: %i\n", strcmp("a", "2"), ft_strcmp("a", "2"));

    printf("\n--- ft_write ---\n");

	rv = ft_write(1, "hello hello", 11);
	printf(", rv=%zd\n", rv);

	rv = ft_write(-1, "error", 5);
	if (rv < 0)
		printf("errno=%i\n", errno);

    printf("\n--- ft_read ---\n");

	int fd = -1;

	rv = ft_read(fd, buf, 85);
	if (rv < 0)
		printf("errno=%i\n\n", errno);

	fd = open("main.c", O_RDONLY, 0);
	if (fd < 0)
		return (1);

	rv = ft_read(fd, buf, 82);
	if (rv < 0)
		printf("errno=%i\n\n", errno);
	else
	{
		buf[rv] = '\0';
		printf("%s\n%zd\n", buf, rv);
	}
	close(fd);

    printf("\n--- ft_strdup ---\n");

	str = ft_strdup("strduuuup");
	printf("ft_strdup: %s\n", str);
	free(str);

	str = ft_strdup("coin coin");
	printf("ft_strdup: %s\n", str);
	free(str);

	// Bonus part

	t_list *begin_list = NULL;
	t_list *int_list = NULL;
	int a = 3;
	int b = 543;
	int c = 90;

	printf("\n--- ft_list_push_front ---\n");
	
	ft_list_push_front(NULL, ("..."));
	ft_list_push_front(&begin_list, "Hello");
	ft_list_push_front(&begin_list, "Aaaaah");
	ft_list_push_front(&begin_list, "Tomato");
	ft_list_push_front(&begin_list, "Houuuuuu");
	print_list(begin_list, 's');

	ft_list_push_front(&int_list, &a);
	ft_list_push_front(&int_list, &b);
	ft_list_push_front(&int_list, &c);
	print_list(int_list, 'i');

	printf("\n--- ft_list_size ---\n");
	printf("size NULL = %i\n", ft_list_size(NULL));
	printf("size = %i\n", ft_list_size(begin_list));
	printf("size = %i\n", ft_list_size(int_list));

	printf("\n--- ft_list_sort ---\n");

	#pragma GCC diagnostic push
	#pragma GCC diagnostic ignored "-Wcast-function-type"
	#pragma GCC diagnostic ignored "-Wincompatible-pointer-types"
	ft_list_sort(&begin_list, (int (*)())cmp_str);
	
	print_list(begin_list, 's');
	ft_lstclear(&begin_list, NULL);

	ft_list_sort(&int_list, (int (*)())cmp_int);
	
	print_list(int_list, 'i');
	ft_lstclear(&int_list, NULL);

	printf("\n--- ft_list_remove_if ---\n");

	t_list	*remove_list = NULL;

    ft_list_remove_if(NULL, "x", (int (*)())cmp_str, free);

	ft_list_push_front(&remove_list, ft_strdup("Tomato"));
	ft_list_push_front(&remove_list, ft_strdup("Ketchup"));
	print_list(remove_list, 's');
	
	ft_list_remove_if(&remove_list, "Tomato", (int (*)())cmp_str, free);
	print_list(remove_list, 's');
	ft_list_remove_if(&remove_list, "Ketchup", (int (*)())cmp_str, free);
	print_list(remove_list, 's');
	#pragma GCC diagnostic pop

	return (0);
}
