#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <string.h>
char *ss = "{\"input\":\"下一首\",\"semantics\":{\"request\":{\"domain\":\"中控\"\"";
char *fetch(unsigned char const *start, unsigned long length);
char *old;
char *new;
int main(int argc, char *argv[])
{
	old = malloc(100);
	memset(old, 0, 100);
	strcpy(old, "导航");

	struct stat stat;
	void *fdm;

	if (argc != 1)
		return 1;

	if (fstat(STDIN_FILENO, &stat) == -1 ||
			stat.st_size == 0)
		return 2;

	fdm = mmap(0, stat.st_size, PROT_READ, MAP_SHARED, STDIN_FILENO, 0);
	if (fdm == MAP_FAILED)
		return 3;

	check(fdm, stat.st_size);

	if (munmap(fdm, stat.st_size) == -1)
		return 4;
	
	free(old);
	return 0;
}

int check(unsigned char const *start, unsigned long length)
{
	static int all;
	static int pass;
	all++;
	memset(new, 0, 100);
	new = fetch(ss, strlen(ss));
	printf("old: %s\t new: %s\n", old, new);
	int r = strncmp(new, old, strlen(ss));
	if (r == 0) {
		pass++;
	}
	memset(old, 0, 100);
	memcpy(old, new, strlen(new));
	free(new);
}

char *fetch(unsigned char const *start, unsigned long length)
{
	char *s = strstr(start, "\"input\":\"");
	printf("%d\n", strlen(s));
	char *c = malloc(100);
	memset(c, 0, 100);
	int i;
	for (i = 0; i < length; i++) {
		if (s[9+i] == '"')
			break;
		c[i] = s[9+i];
	}
	printf("%s\n", c);
	free(s);
	return c;
}
