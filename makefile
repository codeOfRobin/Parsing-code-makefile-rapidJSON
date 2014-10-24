CFLAGS=-ll
CC=g++
all:example2
example2: lex.yy.c bisoner.tab.c 
	$(CC) lex.yy.c bisoner.tab.c Player.cpp City.cpp Monopoly.cpp -o example2 -ll
bisoner.tab.c:bisoner.y
	bison -d bisoner.y 
lex.yy.c:lexer.l 
	lex lexer.l

clean:
	rm -rf *o example2