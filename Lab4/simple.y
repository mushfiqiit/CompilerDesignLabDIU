%{
#include <stdio.h>

int yylex(void);
int yyerror(const char *s);
extern FILE *yyin;
%}

%union {
    int num;
}

/* Tokens */
%token EOL
%token<num> NUMBER
%token PLUS MINUS MUL DIV LPAREN RPAREN

/* Non-terminal value types */
%type<num> exp term factor

%%

/* Allow multiple lines of input */
input:
      /* empty */
    | input line
    ;

line:
      exp EOL          { printf("%d\n", $1); }
    | EOL              /* empty line */
    ;

/* Lowest precedence: + and - */
exp:
      exp PLUS term    { $$ = $1 + $3; }
    | exp MINUS term   { $$ = $1 - $3; }
    | term
    ;

/* Higher precedence: * and / */
term:
      term MUL factor  { $$ = $1 * $3; }
    | term DIV factor  { $$ = $1 / $3; }
    | factor
    ;

/* Highest precedence: numbers and parentheses */
factor:
      NUMBER           { $$ = $1; }
    | LPAREN exp RPAREN { $$ = $2; }
    ;

%%

int main(void) {
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        perror("Could not open input.txt");
        return 1;
    }
    int res = yyparse();
    fclose(yyin);
    return res;
}

int yyerror(const char *s) {
    printf("ERROR: %s\n", s);
    return 0;
}
