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

#ifndef YY_YY_PRUEBA_TAB_H_INCLUDED
# define YY_YY_PRUEBA_TAB_H_INCLUDED
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
    CREATE = 258,                  /* CREATE  */
    DROP = 259,                    /* DROP  */
    TABLE = 260,                   /* TABLE  */
    SELECT = 261,                  /* SELECT  */
    WHERE = 262,                   /* WHERE  */
    GROUPBY = 263,                 /* GROUPBY  */
    ORDERBY = 264,                 /* ORDERBY  */
    INSERT = 265,                  /* INSERT  */
    DELETE = 266,                  /* DELETE  */
    UPDATE = 267,                  /* UPDATE  */
    MAX = 268,                     /* MAX  */
    MIN = 269,                     /* MIN  */
    AVG = 270,                     /* AVG  */
    COUNT = 271,                   /* COUNT  */
    INTO = 272,                    /* INTO  */
    VALUES = 273,                  /* VALUES  */
    FROM = 274,                    /* FROM  */
    SET = 275,                     /* SET  */
    ASC = 276,                     /* ASC  */
    DESC = 277,                    /* DESC  */
    DATO_INTEGER = 278,            /* DATO_INTEGER  */
    DATO_DECIMAL = 279,            /* DATO_DECIMAL  */
    DATO_VARCHAR = 280,            /* DATO_VARCHAR  */
    TIPO_DATO = 281,               /* TIPO_DATO  */
    SUMA = 282,                    /* SUMA  */
    RESTA = 283,                   /* RESTA  */
    MULT = 284,                    /* MULT  */
    DIV = 285,                     /* DIV  */
    IGUALDAD = 286,                /* IGUALDAD  */
    DIFERENCIA = 287,              /* DIFERENCIA  */
    MAYORQ = 288,                  /* MAYORQ  */
    MENORQ = 289,                  /* MENORQ  */
    MAYORIQ = 290,                 /* MAYORIQ  */
    MENORIQ = 291,                 /* MENORIQ  */
    AND = 292,                     /* AND  */
    OR = 293,                      /* OR  */
    PARENTA = 294,                 /* PARENTA  */
    PARENTC = 295,                 /* PARENTC  */
    COMA = 296,                    /* COMA  */
    PUNTOYCOMA = 297,              /* PUNTOYCOMA  */
    ASIGNACION = 298,              /* ASIGNACION  */
    ASTERISCO = 299,               /* ASTERISCO  */
    DIGITO = 300,                  /* DIGITO  */
    LETRA = 301,                   /* LETRA  */
    GUIIONES = 302,                /* GUIIONES  */
    PUNTO = 303,                   /* PUNTO  */
    DOSPUNTOS = 304,               /* DOSPUNTOS  */
    CONST_ENTERO = 305,            /* CONST_ENTERO  */
    CONST_FLOAT = 306,             /* CONST_FLOAT  */
    NUMERO = 307,                  /* NUMERO  */
    IDENTIFICADOR = 308,           /* IDENTIFICADOR  */
    IDENTIFICADORES_CREATE_STATEMENT = 309, /* IDENTIFICADORES_CREATE_STATEMENT  */
    CONST_CADENA = 310             /* CONST_CADENA  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PRUEBA_TAB_H_INCLUDED  */
