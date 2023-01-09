#include <stdio.h>
/*
	Comment outside
*/
int my_func(char *str){printf(str, 10, 9, 34, str);return 0;}

int main(void){
/*
	Comment inside
*/
	char str[] = "#include <stdio.h>%1$c/*%1$c%2$cComment outside%1$c*/%1$cint my_func(char *str){printf(str, 10, 9, 34, str);return 0;}%1$c%1$cint main(void){%1$c/*%1$c%2$cComment inside%1$c*/%1$c%2$cchar str[] = %3$c%4$s%3$c;%1$c%2$creturn (my_func(str));%1$c}%1$c";
	return (my_func(str));
}
