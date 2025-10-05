flex lex1.l

gcc lex.yy.c

a.exe


Starts with a letter or underscore: [_a-zA-Z][_a-zA-Z0-9]*

([a-zA-Z0-9_]*[0-9])    { printf("Valid: %s\n", yytext); }

[a-zA-Z0-9_]*[^0-9\n]   { printf("Invalid: %s (does not end with a digit)\n", yytext); }
