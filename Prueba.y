%{
#include <stdio.h>
extern int yylex();
%}

%token CREATE
%token DROP
%token TABLE
%token SELECT
%token WHERE
%token GROUPBY
%token ORDERBY
%token INSERT
%token DELETE
%token UPDATE
%token MAX
%token MIN
%token AVG
%token COUNT
%token INTO
%token VALUES
%token FROM
%token SET
%token ASC
%token DESC
%token DATO_INTEGER
%token DATO_DECIMAL
%token DATO_VARCHAR
%token TIPO_DATO
%token SUMA
%token RESTA
%token MULT
%token DIV
%token IGUALDAD
%token DIFERENCIA
%token MAYORQ
%token MENORQ
%token MAYORIQ
%token MENORIQ
%token AND
%token OR
%token PARENTA
%token PARENTC
%token COMA
%token PUNTOYCOMA
%token ASIGNACION
%token ASTERISCO
%token DIGITO
%token LETRA
%token GUIIONES
%token PUNTO
%token DOSPUNTOS
%token CONST_ENTERO
%token CONST_FLOAT
%token NUMERO
%token IDENTIFICADOR
%token IDENTIFICADORES_CREATE_STATEMENT
%token CONST_CADENA

%%

start: CREATE_TABLE_STATEMENT
    ;

CREATE_TABLE_STATEMENT: CREATE TABLE IDENTIFICADOR PARENTA IDENTIFICADORES_CREATE_STATEMENT PARENTC PUNTOYCOMA
    {
        printf("CREATE TABLE statement recognized.\n");
        BEGIN 0;
    }
    | error PUNTOYCOMA
    {
        printf("Syntax error in CREATE TABLE statement. Continuing from the next semicolon.\n");
        yyerrok;
    }
    | error
    {
        printf("Syntax error in CREATE TABLE statement. Skipping to the next statement.\n");
        BEGIN 0;
    };

DROP_TABLE_STATEMENT: DROP TABLE IDENTIFICADOR PUNTOYCOMA
    {
        printf("DROP TABLE statement recognized.\n");
        BEGIN 0;
    }
    | error PUNTOYCOMA
    {
        printf("Syntax error in DROP TABLE statement. Continuing from the next semicolon.\n");
        yyerrok;
    }
    | error
    {
        printf("Syntax error in DROP TABLE statement. Skipping to the next statement.\n");
        BEGIN 0;
    };

%%

int yyerror(const char *s) {
    printf("Error: %s\n", s);
    return 0;
}

int main() {
    BEGIN CREATE_TABLE_STATEMENT;
    yyparse();
    return 0;
}
