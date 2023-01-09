#include <stdio.h>
#define FILENAME "Grace_kid.c"
#define STRING "#include <stdio.h>%1$c#define FILENAME %2$cGrace_kid.c%2$c%1$c#define STRING %2$c%3$s%2$c%1$c#define START() int main(void) { FILE *file = fopen(FILENAME, %2$cw%2$c); if (file) { fprintf(file, STRING, 10, 34, STRING, 9); fclose(file); } return 0; }%1$c/*%1$c%4$cComment Grace%1$c*/%1$cSTART()%1$c"
#define START() int main(void) { FILE *file = fopen(FILENAME, "w"); if (file) { fprintf(file, STRING, 10, 34, STRING, 9); fclose(file); } return 0; }
/*
	Comment Grace
*/
START()
