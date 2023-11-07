%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string>
    #include <vector>
    #include <iostream>
    #include <fstream>
    #include <algorithm>
    #include <map>
    #include "LAB02.hpp"

    using namespace std;

    int errores = 0;
    vector<string> ids;

    int idexiste(string id){
        for(int i = 0; i < ids.size(); i++){
            if(ids.at(i) == id){
                return i;
            }
        }
        return -1;
    }

    void add_id(string id) {
        ids.insert(ids.end(), id);
    }

%}

%option case-insensitive
%option noyywrap

/*TOKENS*/

/*COMANDOS*/
CREATETABLE "CREATE TABLE"|"CREATE Table"|"Create table"
DROPTABLE "DROP TABLE"|"DROP table"
SELECT "SELECT"
WHERE "WHERE"
GROUPBY "GROUP BY"
ORDERBY "ORDER BY"
INSERT "INSERT"
DELETE "DELETE"
UPDATE "UPDATE"
MAX "MAX"
MIN "MIN"
AVG "AVG"
COUNT "COUNT"
INTO "INTO"
VALUES "VALUES"
FROM "FROM"
SET "SET"
ASC "ASC"
DESC "DESC"

/*TIPOS DE DATOS*/
DATO_INTEGER "INTEGER"
DATO_DECIMAL "DECIMAL"
DATO_VARCHAR "VARCHAR"
TIPO_DATO {DATO_INTEGER}|{DATO_DECIMAL}|{DATO_VARCHAR}

/*OPERADORES*/
SUMA "+"
RESTA "-"
MULT "*"
DIV "/"
IGUALDAD "=="
DIFERENCIA "<>"
MAYORQ ">"
MENORQ "<"
MAYORIQ ">="
MENORIQ "<="
AND "AND"
OR "OR"

/*SEPARADORES*/
PARENTA "("
PARENTC ")"
COMA ","
PUNTOYCOMA ";"
ASIGNACION "="

/*CARACTERES ESPECIALES*/
ASTERISCO "*"

/*IDENTIFICADORES, NUMEROS Y CADENAS*/
DIGITO [0-9]
LETRA [a-zA-ZñÑ]|á|é|í|ó|ú
GUIIONES [-_]
PUNTO "."
DOSPUNTOS ":"
CONST_ENTERO (-?[1-9][0-9]*)|0
CONST_FLOAT {DIGITO}+{PUNTO}{DIGITO}+
NUMERO {CONST_ENTERO}|{CONST_FLOAT}
IDENTIFICADOR {LETRA}({LETRA}|{NUMERO}|{GUIIONES})*
CONST_CADENA \"[^\n"]*\"|\'[^\n']*\'
ERROR {DIGITO}+{LETRA}+({DIGITO}|{LETRA})*|[^{NUMERO}]{PUNTO}[^{NUMERO}]

/*REGLAS*/
%%
{CREATETABLE}    {printf("CREATE TABLE "); return (CREATETABLE);}
{DROPTABLE}      {printf("DROP TABLE "); return (DROPTABLE);}
{SELECT}         {printf("SELECT "); return (SELECT);}
{WHERE}          {printf("WHERE "); return (WHERE);}
{GROUPBY}        {printf("GROUP BY "); return (GROUPBY);}
{ORDERBY}        {printf("ORDER BY "); return (ORDERBY);}
{INSERT}         {printf("INSERT "); return (INSERT);}
{DELETE}         {printf("DELETE "); return (DELETE);}
{UPDATE}         {printf("UPDATE "); return (UPDATE);}
{MAX}            {printf("MAX "); return (MAX);}
{MIN}            {printf("MIN "); return (MIN);}
{AVG}            {printf("AVG "); return (AVG);}
{COUNT}          {printf("COUNT "); return (COUNT);}
{INTO}           {printf("INTO "); return (INTO);}
{VALUES}         {printf("VALUES "); return (VALUES);}
{FROM}           {printf("FROM "); return (FROM);}
{SET}            {printf("SET "); return (SET);}
{ASC}            {printf("ASC "); return (ASC);}
{DESC}           {printf("DESC "); return (DESC);}
{DATO_INTEGER}   {printf("INTEGER "); return (DATO_INTEGER);}
{DATO_DECIMAL}   {printf("DECIMAL "); return (DATO_DECIMAL);}
{DATO_VARCHAR}   {printf("VARCHAR "); return (DATO_VARCHAR);}
{SUMA}           {printf("%s ",yytext); return (SUMA);}
{RESTA}          {printf("%s ",yytext); return (RESTA);}
{MULT}           {printf("%s ",yytext); return (MULT);}
{DIV}            {printf("%s ",yytext); return (DIV);}
{IGUALDAD}       {printf("%s ",yytext); return (IGUALDAD);}
{DIFERENCIA}     {printf("%s ",yytext); return (DIFERENCIA);}
{MAYORQ}         {printf("%s ",yytext); return (MAYORQ);}
{MENORQ}         {printf("%s ",yytext); return (MENORQ);}
{MAYORIQ}        {printf("%s ",yytext); return (MAYORIQ);}
{MENORIQ}        {printf("%s ",yytext); return (MENORIQ);}
{AND}            {printf("%s ",yytext); return (AND);}
{OR}             {printf("%s ",yytext); return (OR);}
{PARENTA}        {printf("%s ",yytext); return (PARENTA);}
{PARENTC}        {printf("%s ",yytext); return (PARENTC);}
{COMA}           {printf("%s ",yytext); return (COMA);}
{PUNTOYCOMA}     {printf("%s ",yytext); return (PUNTOYCOMA);}
{ASIGNACION}     {printf("%s ",yytext); return (ASIGNACION);}
[^({NUMERO}|{PARENTA})]{ASTERISCO}[^({NUMERO}|{PARENTC})] {printf("%s ",yytext); return (ASTERISCO);}
{CONST_ENTERO}   {printf("%s ",yytext); return (CONST_ENTERO);}
{CONST_FLOAT}    {printf("%s ",yytext); return (CONST_FLOAT);}
{IDENTIFICADOR}  {int idtemp = idexiste(yytext);
                  if(idtemp == -1){
                    ids.insert(ids.end(), yytext);
                    idtemp = idexiste(yytext);
                  }
                  printf("%s ", yytext); return (IDENTIFICADOR);}
{CONST_CADENA}   {printf("%s",yytext); return (CONST_CADENA);}
{ERROR}          {printf("%s ", yytext); return (ERROR);}

%%