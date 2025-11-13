Compilation Steps:

1. flex lexer.l
2. bison -d -t simple.y
3. gcc lex.yy.c simple.tab.c
4. ./a.exe
