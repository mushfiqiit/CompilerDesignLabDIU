/*Definition Section */
%{
#include <stdio.h>
int keywords=0;
%}


/*Rules Section */
%%
(int|printf) { 
    keywords++; 
    printf("%s is a keyword \n", yytext);    
}
. {}

%%

/* User code */

int main() {
    yyin=fopen("input.c", "r");
    yylex();
    printf("Total number of keywords: %d \n", keywords);
}

int yywrap() {
    return 1;
}
