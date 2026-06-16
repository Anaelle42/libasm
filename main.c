#include "libasm.h"

int main(void)
{
	char *str;
    char buf[256];
	ssize_t	rv;

    printf("--- ft_strlen ---\n");

    printf("strlen: %zu\n", strlen("Hello"));
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

	return (0);
}