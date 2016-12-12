#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <string.h>
#include <stdlib.h>

#if 1
#define pf(format, ...) \
	{printf("[%s : %s : %d] ", \
	__FILE__, __func__, __LINE__); \
	printf(format, ##__VA_ARGS__);}
#else
#define pf(format, ...) 
#endif

int fetch(unsigned char const *start, unsigned long length)
{
	static int z;
	char *c = malloc(100);
	memset(c, 0, 100);
	int i;
	for (i = 0; i < (length -7); i++) {
		if ((start[i] == 'i')
			&& start[i+1] == 'n'
			&& start[i+2] == 'p'
			&& start[i+3] == 'u'
			&& start[i+4] == 't'
			&& start[i+5] == '"'
			&& start[i+6] == ':'
			&& start[i+7] == '"') {
			memset(c, 0, 100);
			int j;
			for (j = 0; j < length; j++) {
				if (start[i+8+j] == '"')
					break;
				c[j] = start[i+8+j];
			}
			printf("%s  ", c);
			memset(c, 0, 100);
			z++;
			if ((z%8) == 0)
				printf("\n--------------------------------------------------------\n");
		}
	}
	printf("\ntest case number : %d\n", z);
	return 0;
}

int main(int argc, char *argv[])
{
	struct stat stat;
	void *fdm;

	if (argc != 1) {
		printf("%s %d\n", __func__, __LINE__);
		return 1;
	}
	if (fstat(STDIN_FILENO, &stat) == -1 ||
			stat.st_size == 0) {
		printf("%s %d: %d\n", __func__, __LINE__, stat.st_size);
		return 2;
	}

	fdm = mmap(0, stat.st_size, PROT_READ, MAP_SHARED, STDIN_FILENO, 0);
	if (fdm == MAP_FAILED) {
		printf("%s %d\n", __func__, __LINE__);
		return 3;
	}
	fetch(fdm, stat.st_size);
	if (munmap(fdm, stat.st_size) == -1) {
		printf("%s %d\n", __func__, __LINE__);
		return 4;
	}
	return 0;
}
