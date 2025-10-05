/*Definition Section */
%{
#include <stdio.h>
int identifiers=0;
%}


/*Rules Section */
%%

[a-zA-Z_][a-zA-Z0-9]* {
identifiers++;
printf("%s is an identifier\n", yytext);
}

. {}
%%

int main()
{
	yyin=fopen("input.c", "r");
	yylex();
	printf("Number of identifiers is %d\n", identifiers);

	return 0;
}

int yywrap()
{
return 1;
}