/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     LTOKEN = 258,
     INTEGER = 259,
     LOCATIONWORD = 260,
     WORD = 261,
     GTOKEN = 262,
     CURRENCYTOKEN = 263,
     JAILFINETOKEN = 264,
     STARTINGMONEYTOKEN = 265,
     RTOKEN = 266,
     COSTTOKEN = 267,
     RENTTOKEN = 268,
     FILEPATHTOKEN = 269,
     OBJEXTENSION = 270,
     MODELTOKEN = 271,
     TAXTOKEN = 272,
     PERCENTSIGN = 273
   };
#endif
/* Tokens.  */
#define LTOKEN 258
#define INTEGER 259
#define LOCATIONWORD 260
#define WORD 261
#define GTOKEN 262
#define CURRENCYTOKEN 263
#define JAILFINETOKEN 264
#define STARTINGMONEYTOKEN 265
#define RTOKEN 266
#define COSTTOKEN 267
#define RENTTOKEN 268
#define FILEPATHTOKEN 269
#define OBJEXTENSION 270
#define MODELTOKEN 271
#define TAXTOKEN 272
#define PERCENTSIGN 273




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 23 "bisoner.y"
{
  std::string *str;
  int number;
}
/* Line 1529 of yacc.c.  */
#line 90 "bisoner.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

