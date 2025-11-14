/* Definition Section */
%{
#include <stdio.h>

int yylex(void);
int yyerror(const char *s);
extern FILE *yyin;
%}

%union {
    int num;
}

/* Token */
%token EOL
%token<num> NUMBER
%token PLUS
%type<num> exp
%token MINUS

%%

input:
|   exp EOL { printf("%d \n", $1);  }
;

exp:
    NUMBER { $$ = $1; }
|   exp PLUS exp { $$ = $1 + $3; }
|   exp MINUS exp { $$ = $1 - $3; }
;

%%
/* User Section */
int main(void) {
    yyin = fopen("input.txt", "r");
    int res=yyparse();
    fclose(yyin);
    return res;
}

int yyerror(const char *s) {
    printf("ERROR: %s \n", s);
    return 0;
}
