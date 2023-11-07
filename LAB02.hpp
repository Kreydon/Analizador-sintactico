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
    WHERE = 261,                   /* WHERE  */
    GROUPBY = 262,                 /* GROUPBY  */
    ORDERBY = 263,                 /* ORDERBY  */
    INSERT = 264,                  /* INSERT  */
    DELETE = 265,                  /* DELETE  */
    UPDATE = 266,                  /* UPDATE  */
    MAX = 267,                     /* MAX  */
    MIN = 268,                     /* MIN  */
    AVG = 269,                     /* AVG  */
    COUNT = 270,                   /* COUNT  */
    INTO = 271,                    /* INTO  */
    VALUES = 272,                  /* VALUES  */
    FROM = 273,                    /* FROM  */
    SET = 274,                     /* SET  */
    ASC = 275,                     /* ASC  */
    DESC = 276,                    /* DESC  */
    DATO_INTEGER = 277,            /* DATO_INTEGER  */
    DATO_DECIMAL = 278,            /* DATO_DECIMAL  */
    DATO_VARCHAR = 279,            /* DATO_VARCHAR  */
    TIPO_DATO = 280,               /* TIPO_DATO  */
    SUMA = 281,                    /* SUMA  */
    RESTA = 282,                   /* RESTA  */
    MULT = 283,                    /* MULT  */
    DIV = 284,                     /* DIV  */
    IGUALDAD = 285,                /* IGUALDAD  */
    DIFERENCIA = 286,              /* DIFERENCIA  */
    MAYORQ = 287,                  /* MAYORQ  */
    MENORQ = 288,                  /* MENORQ  */
    MAYORIQ = 289,                 /* MAYORIQ  */
    MENORIQ = 290,                 /* MENORIQ  */
    AND = 291,                     /* AND  */
    OR = 292,                      /* OR  */
    PARENTA = 293,                 /* PARENTA  */
    PARENTC = 294,                 /* PARENTC  */
    COMA = 295,                    /* COMA  */
    PUNTOYCOMA = 296,              /* PUNTOYCOMA  */
    ASIGNACION = 297,              /* ASIGNACION  */
    ASTERISCO = 298,               /* ASTERISCO  */
    DIGITO = 299,                  /* DIGITO  */
    LETRA = 300,                   /* LETRA  */
    GUIIONES = 301,                /* GUIIONES  */
    PUNTO = 302,                   /* PUNTO  */
    DOSPUNTOS = 303,               /* DOSPUNTOS  */
    CONST_ENTERO = 304,            /* CONST_ENTERO  */
    CONST_FLOAT = 305,             /* CONST_FLOAT  */
    NUMERO = 306,                  /* NUMERO  */
    IDENTIFICADOR = 307,           /* IDENTIFICADOR  */
    IDENTIFICADORES_CREATE_STATEMENT = 308, /* IDENTIFICADORES_CREATE_STATEMENT  */
    CONST_CADENA = 309             /* CONST_CADENA  */
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
#define WHERE 261
#define GROUPBY 262
#define ORDERBY 263
#define INSERT 264
#define DELETE 265
#define UPDATE 266
#define MAX 267
#define MIN 268
#define AVG 269
#define COUNT 270
#define INTO 271
#define VALUES 272
#define FROM 273
#define SET 274
#define ASC 275
#define DESC 276
#define DATO_INTEGER 277
#define DATO_DECIMAL 278
#define DATO_VARCHAR 279
#define TIPO_DATO 280
#define SUMA 281
#define RESTA 282
#define MULT 283
#define DIV 284
#define IGUALDAD 285
#define DIFERENCIA 286
#define MAYORQ 287
#define MENORQ 288
#define MAYORIQ 289
#define MENORIQ 290
#define AND 291
#define OR 292
#define PARENTA 293
#define PARENTC 294
#define COMA 295
#define PUNTOYCOMA 296
#define ASIGNACION 297
#define ASTERISCO 298
#define DIGITO 299
#define LETRA 300
#define GUIIONES 301
#define PUNTO 302
#define DOSPUNTOS 303
#define CONST_ENTERO 304
#define CONST_FLOAT 305
#define NUMERO 306
#define IDENTIFICADOR 307
#define IDENTIFICADORES_CREATE_STATEMENT 308
#define CONST_CADENA 309

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_LAB02_HPP_INCLUDED  */
