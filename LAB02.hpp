/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_LAB02_HPP_INCLUDED
# define YY_YY_LAB02_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    CREATETABLE = 258,             /* CREATETABLE  */
    DROPTABLE = 259,               /* DROPTABLE  */
    SELECT = 260,                  /* SELECT  */
    INSERT = 261,                  /* INSERT  */
    DELETE = 262,                  /* DELETE  */
    UPDATE = 263,                  /* UPDATE  */
    FROM = 264,                    /* FROM  */
    WHERE = 265,                   /* WHERE  */
    VALUES = 266,                  /* VALUES  */
    INTO = 267,                    /* INTO  */
    SET = 268,                     /* SET  */
    GROUPBY = 269,                 /* GROUPBY  */
    ORDERBY = 270,                 /* ORDERBY  */
    MAX = 271,                     /* MAX  */
    MIN = 272,                     /* MIN  */
    AVG = 273,                     /* AVG  */
    COUNT = 274,                   /* COUNT  */
    ASC = 275,                     /* ASC  */
    DESC = 276,                    /* DESC  */
    DATO_INTEGER = 277,            /* DATO_INTEGER  */
    DATO_DECIMAL = 278,            /* DATO_DECIMAL  */
    DATO_VARCHAR = 279,            /* DATO_VARCHAR  */
    SUMA = 280,                    /* SUMA  */
    RESTA = 281,                   /* RESTA  */
    MULT = 282,                    /* MULT  */
    DIV = 283,                     /* DIV  */
    IGUALDAD = 284,                /* IGUALDAD  */
    DIFERENCIA = 285,              /* DIFERENCIA  */
    MAYORQ = 286,                  /* MAYORQ  */
    MENORQ = 287,                  /* MENORQ  */
    MAYORIQ = 288,                 /* MAYORIQ  */
    MENORIQ = 289,                 /* MENORIQ  */
    ASIGNACION = 290,              /* ASIGNACION  */
    AND = 291,                     /* AND  */
    OR = 292,                      /* OR  */
    PARENTA = 293,                 /* PARENTA  */
    PARENTC = 294,                 /* PARENTC  */
    COMA = 295,                    /* COMA  */
    PUNTOYCOMA = 296,              /* PUNTOYCOMA  */
    ASTERISCO = 297,               /* ASTERISCO  */
    PUNTO = 298,                   /* PUNTO  */
    DOSPUNTOS = 299,               /* DOSPUNTOS  */
    DIGITO = 300,                  /* DIGITO  */
    LETRA = 301,                   /* LETRA  */
    GUIIONES = 302,                /* GUIIONES  */
    NUMERO = 303,                  /* NUMERO  */
    CONST_ENTERO = 304,            /* CONST_ENTERO  */
    CONST_FLOAT = 305,             /* CONST_FLOAT  */
    CONST_CADENA = 306,            /* CONST_CADENA  */
    IDENTIFICADOR = 307,           /* IDENTIFICADOR  */
    ERROR = 308                    /* ERROR  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define CREATETABLE 258
#define DROPTABLE 259
#define SELECT 260
#define INSERT 261
#define DELETE 262
#define UPDATE 263
#define FROM 264
#define WHERE 265
#define VALUES 266
#define INTO 267
#define SET 268
#define GROUPBY 269
#define ORDERBY 270
#define MAX 271
#define MIN 272
#define AVG 273
#define COUNT 274
#define ASC 275
#define DESC 276
#define DATO_INTEGER 277
#define DATO_DECIMAL 278
#define DATO_VARCHAR 279
#define SUMA 280
#define RESTA 281
#define MULT 282
#define DIV 283
#define IGUALDAD 284
#define DIFERENCIA 285
#define MAYORQ 286
#define MENORQ 287
#define MAYORIQ 288
#define MENORIQ 289
#define ASIGNACION 290
#define AND 291
#define OR 292
#define PARENTA 293
#define PARENTC 294
#define COMA 295
#define PUNTOYCOMA 296
#define ASTERISCO 297
#define PUNTO 298
#define DOSPUNTOS 299
#define DIGITO 300
#define LETRA 301
#define GUIIONES 302
#define NUMERO 303
#define CONST_ENTERO 304
#define CONST_FLOAT 305
#define CONST_CADENA 306
#define IDENTIFICADOR 307
#define ERROR 308

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_LAB02_HPP_INCLUDED  */
