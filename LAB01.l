%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string>
    #include <vector>
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
IDENTIFICADORES_CREATE_STATEMENT ({IDENTIFICADOR}{TIPO_DATO}{PARENTA}{NUMERO}{PARENTC})+
CONST_CADENA \"[^\n"]*\"|\'[^\n']*\'

ERROR {DIGITO}+{LETRA}+({DIGITO}|{LETRA})*|[^{NUMERO}]{PUNTO}[^{NUMERO}]

/*REGLAS*/
%%
{CREATETABLE}    {printf("CREATE TABLE ");}
{DROPTABLE}      {printf("DROP TABLE ");}
{SELECT}         {printf("SELECT ");}
{WHERE}          {printf("WHERE ");}
{GROUPBY}        {printf("GROUP BY ");}
{ORDERBY}        {printf("ORDER BY ");}
{INSERT}         {printf("INSERT ");}
{DELETE}         {printf("DELETE ");}
{UPDATE}         {printf("UPDATE ");}
{MAX}            {printf("MAX ");}
{MIN}            {printf("MIN ");}
{AVG}            {printf("AVG ");}
{COUNT}          {printf("COUNT ");}
{INTO}           {printf("INTO ");}
{VALUES}         {printf("VALUES ");}
{FROM}           {printf("FROM ");}
{SET}            {printf("SET ");}
{ASC}            {printf("ASC ");}
{DESC}           {printf("DESC ");}
{DATO_INTEGER}   {printf("INTEGER ");}
{DATO_DECIMAL}   {printf("DECIMAL ");}
{DATO_VARCHAR}   {printf("VARCHAR ");}
{SUMA}           {printf("%s ",yytext);}
{RESTA}          {printf("%s ",yytext);}
{MULT}           {printf("%s ",yytext);}
{DIV}            {printf("%s ",yytext);}
{IGUALDAD}       {printf("%s ",yytext);}
{DIFERENCIA}     {printf("%s ",yytext);}
{MAYORQ}         {printf("%s ",yytext);}
{MENORQ}         {printf("%s ",yytext);}
{MAYORIQ}        {printf("%s ",yytext);}
{MENORIQ}        {printf("%s ",yytext);}
{AND}            {printf("%s ",yytext);}
{OR}             {printf("%s ",yytext);}
{PARENTA}        {printf("%s ",yytext);}
{PARENTC}        {printf("%s ",yytext);}
{COMA}           {printf("%s ",yytext);}
{PUNTOYCOMA}     {printf("%s ",yytext); BEGIN 0;}  // Vuelve al estado inicial
{ASIGNACION}     {printf("%s ",yytext);}
[^({NUMERO}|{PARENTA})]{ASTERISCO}[^({NUMERO}|{PARENTC})] {printf("%s ",yytext);}
{CONST_ENTERO}   {printf("%s ",yytext);}
{CONST_FLOAT}    {printf("%s ",yytext);}
{IDENTIFICADOR}  {int idtemp = idexiste(yytext);
                  if(idtemp == -1){
                    ids.insert(ids.end(), yytext);
                    idtemp = idexiste(yytext);
                  }
                  printf("%s ", yytext);}
{CONST_CADENA}   {printf("%s",yytext);}

{ERROR}          {printf("%s ", yytext);}
%%

/*CODIGO*/
int yywrap(){return 1;}

int main( int argc, char **argv ){
    ++argv, --argc;
    if ( argc > 0 )
        yyin = fopen( argv[0], "r" );
    else
        yyin = stdin;

    yylex();
}