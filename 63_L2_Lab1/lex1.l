/*Definition Section */
%{
#include <stdio.h>
int keywords=0;
int identifiers=0;
%}


/*Rules Section */
%%
(int|printf) { 
    keywords++; 
    printf("%s is a keyword \n", yytext);    
}

[a-zA-Z_][a-zA-Z_0-9]* {
    identifiers++; 
    printf("%s is a identifier \n", yytext);
}

. {}

%%

/* User code */

int main() {
    yyin=fopen("input.c", "r");
    yylex();
    printf("Total number of keywords: %d \n", keywords);
    printf("Total number of identifiers: %d \n", identifiers);
}

int yywrap() {
    return 1;
}
