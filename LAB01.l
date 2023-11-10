%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string>
    #include <vector>
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

/*OPERADORES*/
SUMA "+"
RESTA "-"
MULT "*"
DIV "/"
ASIGNACION "="
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
{CREATETABLE}    {return (CREATETABLE);}
{DROPTABLE}      {return (DROPTABLE);}
{SELECT}         {return (SELECT);}
{WHERE}          {return (WHERE);}
{GROUPBY}        {return (GROUPBY);}
{ORDERBY}        {return (ORDERBY);}
{INSERT}         {return (INSERT);}
{DELETE}         {return (DELETE);}
{UPDATE}         {return (UPDATE);}
{MAX}            {return (MAX);}
{MIN}            {return (MIN);}
{AVG}            {return (AVG);}
{COUNT}          {return (COUNT);}
{INTO}           {return (INTO);}
{VALUES}         {return (VALUES);}
{FROM}           {return (FROM);}
{SET}            {return (SET);}
{ASC}            {return (ASC);}
{DESC}           {return (DESC);}
{DATO_INTEGER}   {return (DATO_INTEGER);}
{DATO_DECIMAL}   {return (DATO_DECIMAL);}
{DATO_VARCHAR}   {return (DATO_VARCHAR);}
{SUMA}           {return (SUMA);}
{RESTA}          {return (RESTA);}
{MULT}           {return (MULT);}
{DIV}            {return (DIV);}
{IGUALDAD}       {return (IGUALDAD);}
{DIFERENCIA}     {return (DIFERENCIA);}
{MAYORQ}         {return (MAYORQ);}
{MENORQ}         {return (MENORQ);}
{MAYORIQ}        {return (MAYORIQ);}
{MENORIQ}        {return (MENORIQ);}
{AND}            {return (AND);}
{OR}             {return (OR);}
{PARENTA}        {return (PARENTA);}
{PARENTC}        {return (PARENTC);}
{COMA}           {return (COMA);}
{PUNTOYCOMA}     {return (PUNTOYCOMA);}
{ASIGNACION}     {return (ASIGNACION);}
[^({NUMERO}|{PARENTA})]{ASTERISCO}[^({NUMERO}|{PARENTC})] {return (ASTERISCO);}
{CONST_ENTERO}   {return (CONST_ENTERO);}
{CONST_FLOAT}    {return (CONST_FLOAT);}
{IDENTIFICADOR}  {int idtemp = idexiste(yytext);
                  if(idtemp == -1){
                    ids.insert(ids.end(), yytext);
                    idtemp = idexiste(yytext);
                  }
                  return (IDENTIFICADOR);}
{CONST_CADENA}   {return (CONST_CADENA);}
{ERROR}          {return (ERROR);}

%%