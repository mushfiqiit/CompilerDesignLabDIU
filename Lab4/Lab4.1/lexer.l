/* Definition Section */
%{
#include <stdio.h>
#include <stdlib.h>
#include "simple.tab.h"

%}
/* Rules Section */
%%
[0-9]+ { yylval.num=atoi(yytext); return NUMBER; } // convert string to int
"+" { return PLUS; }
"-" { return MINUS; }
\n { return EOL; }
. {}

%%

int yywrap(void) { return 1; }