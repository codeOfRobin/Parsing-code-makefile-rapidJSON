CFLAGS=-ll
CC=g++
all:example2
example2: main.cpp lex.yy.c bisoner.tab.c
	$(CC) main.cpp lex.yy.c bisoner.tab.c Player.cpp Location.cpp Monopoly.cpp -o example2 -ll -lboost_serialization
bisoner.tab.c:bisoner.y
	bison -d bisoner.y
lex.yy.c:lexer.l 
	lex lexer.l

clean:
	rm -rf *o example2