#!/bin/bash
cd /Users/robinmalhotra2/Developer/opengl/opengl/Parsing code
echo:"Parsing"
flex Snazzle.l
g++ lex.yy.c -ll -o snazzle
ls
./snazzle



