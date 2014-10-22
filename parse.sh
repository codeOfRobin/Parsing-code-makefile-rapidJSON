bison -d bisoner.y
lex lexer.l
g++ lex.yy.c bisoner.tab.c -o example1 -ll
