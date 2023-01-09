#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#define STRING "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <string.h>%1$c#include <stdlib.h>%1$c#define STRING %2$c%3$s%2$c%1$c%1$cint main(void)%1$c{%1$c%6$cint i = %4$d;%1$c%6$cif (i >= 0) {%1$c%6$c%6$cif (!access(%2$cSully_5.c%2$c, F_OK))%1$c%6$c%6$c%6$ci--;%1$c%6$c%6$cchar filename[] = %2$cSully_X.c%2$c;%1$c%6$c%6$cfilename[6] = 48 + i;%1$c%6$c%6$cFILE *file = fopen(filename, %2$cw%2$c);%1$c%6$cif (file) {%1$c%6$c%6$cfprintf(file, STRING, 10, 34, STRING, i, 37, 9);%1$c%6$c%6$cfclose(file);%1$c%6$c%6$cchar buf[100];%1$c%6$c%6$cchar output[8] = {0};%1$c%6$c%6$cstrncpy(output, filename, 7);%1$c%6$c%6$cif (i+1)%1$c%6$c%6$c%6$csprintf(buf, %2$cgcc %5$c1$s -o %5$c2$s && ./%5$c2$s%2$c, filename, output);%1$c%6$c%6$celse%1$c%6$c%6$c%6$csprintf(buf, %2$cgcc %5$c1$s -o %5$c2$s%2$c, filename, output);%1$c%6$c%6$creturn system(buf);%1$c%6$c}%1$c%6$celse%1$c%6$c%6$creturn 1;%1$c%6$c}%1$c%6$creturn 0;%1$c}%1$c%1$c"

int main(void)
{
	int i = 5;
	if (i >= 0) {
		if (!access("Sully_5.c", F_OK))
			i--;
		char filename[] = "Sully_X.c";
		filename[6] = 48 + i;
		FILE *file = fopen(filename, "w");
	if (file) {
		fprintf(file, STRING, 10, 34, STRING, i, 37, 9);
		fclose(file);
		char buf[100];
		char output[8] = {0};
		strncpy(output, filename, 7);
		if (i+1)
			sprintf(buf, "gcc %1$s -o %2$s && ./%2$s", filename, output);
		else
			sprintf(buf, "gcc %1$s -o %2$s", filename, output);
		return system(buf);
	}
	else
		return 1;
	}
	return 0;
}

