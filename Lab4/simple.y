%{
/* Definition Section */

%}

%union {
    int num;
    char sym;
}

%token EOL
%token<num> NUMBER

/* Rules Section */
%%

input: exp 
    EOL { printf("%d \n", $1); } 
|   EOL;

exp: 
    NUMBER { $$ = $1; } 
|   exp PLUS exp { $$ = $1 + $3; }

%%
int main() {
    yyparse();

    return 0;
}
