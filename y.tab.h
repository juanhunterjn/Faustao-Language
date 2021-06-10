
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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
     ESSAFERA = 258,
     OLOKOBIXO = 259,
     NUMERO = 260,
     LETRA = 261,
     PALAVRA = 262,
     BRINCADEIRAMEU = 263,
     EITA = 264,
     MENORIGUAL = 265,
     MAIORIGUAL = 266,
     IGUAL = 267,
     DIFERENTE = 268,
     OU = 269,
     E = 270,
     TAPEGANDOFOGOBIXO = 271,
     MAIOR = 272,
     MENOR = 273,
     CHURRASQUEIRAELETRICA = 274,
     FAZAOVIVO = 275,
     MENOSU = 276
   };
#endif
/* Tokens.  */
#define ESSAFERA 258
#define OLOKOBIXO 259
#define NUMERO 260
#define LETRA 261
#define PALAVRA 262
#define BRINCADEIRAMEU 263
#define EITA 264
#define MENORIGUAL 265
#define MAIORIGUAL 266
#define IGUAL 267
#define DIFERENTE 268
#define OU 269
#define E 270
#define TAPEGANDOFOGOBIXO 271
#define MAIOR 272
#define MENOR 273
#define CHURRASQUEIRAELETRICA 274
#define FAZAOVIVO 275
#define MENOSU 276




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 22 "faustao.y"
int num; char id; char* str;


/* Line 1676 of yacc.c  */
#line 98 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


