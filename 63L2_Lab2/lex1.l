/*Definition Section */
%{
#include <stdio.h>

%}


/*Rules Section */
%%
x+ {
    printf("Matched one or more occurrences of x: %s \n", yytext);
}
x+y+ {
    printf("Matched one or more occurrences of x and y: %s\n", yytext);
}

xyz {
    printf("Matched xyz exactly: %s \n", yytext);
}

. {}

%%

/* User code */

int main() {
    yyin=fopen("input.c", "r");
    yylex();

}

int yywrap() {
    return 1;
}
