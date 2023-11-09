%{
    #include <cstdio>
    #include <iostream>
    #include <vector>

    using namespace std;

    int yylex();
    int yyerror(const char* s);
    extern "C" FILE* yyin;

    vector<int> mistakes;
    int numero_linea = 1;
%}

%token CREATETABLE DROPTABLE SELECT INSERT DELETE UPDATE
%token FROM WHERE VALUES INTO SET
%token GROUPBY ORDERBY
%token MAX MIN AVG COUNT
%token ASC DESC
%token DATO_INTEGER DATO_DECIMAL DATO_VARCHAR
%token SUMA RESTA MULT DIV
%token IGUALDAD DIFERENCIA MAYORQ MENORQ MAYORIQ MENORIQ ASIGNACION
%token AND OR
%token PARENTA PARENTC
%token COMA PUNTOYCOMA ASTERISCO PUNTO DOSPUNTOS
%token DIGITO LETRA GUIIONES NUMERO
%token CONST_ENTERO CONST_FLOAT CONST_CADENA
%token IDENTIFICADOR
%token ERROR

%start comand

%%

comand: comandos varios_comand;
varios_comand: | comandos comand;
comandos: create_statement { numero_linea++; }
        | drop_statement { numero_linea++; }
        | select_statement { numero_linea++; }
        | insert_statement { numero_linea++; }
        | delete_statement { numero_linea++; }
        | update_statement { numero_linea++; }
        | error PUNTOYCOMA { mistakes.push_back(numero_linea++); }

tipo_dato: DATO_INTEGER | DATO_DECIMAL | DATO_VARCHAR;
value: CONST_ENTERO | CONST_FLOAT | CONST_CADENA;
operadores: ASIGNACION | DIFERENCIA | MAYORIQ | MENORIQ | MAYORQ | MENORQ | IGUALDAD;
tipo_funcion: MAX | MIN | AVG | COUNT;


create_statement: CREATETABLE IDENTIFICADOR PARENTA create_datos PARENTC PUNTOYCOMA;
create_datos: create_dato varios_create;
varios_create: | COMA create_datos;
create_dato: IDENTIFICADOR tipo_dato dato | IDENTIFICADOR tipo_dato;
dato: PARENTA CONST_ENTERO PARENTC;

drop_statement: DROPTABLE IDENTIFICADOR PUNTOYCOMA;

insert_statement: INSERT INTO IDENTIFICADOR VALUES PARENTA insert_values PARENTC PUNTOYCOMA;
insert_values: value varios_insert;
varios_insert: | COMA insert_values;

delete_statement: DELETE FROM IDENTIFICADOR WHERE where_conditions PUNTOYCOMA;
where_conditions: where_condition varios_where;
varios_where: | AND where_conditions | OR where_conditions; 
where_condition: IDENTIFICADOR operadores value | value operadores IDENTIFICADOR;

update_statement: UPDATE IDENTIFICADOR SET IDENTIFICADOR IGUALDAD option WHERE where_conditions PUNTOYCOMA;
option: IDENTIFICADOR | where_conditions;

select_statement: SELECT busqueda FROM IDENTIFICADOR condition group order PUNTOYCOMA;
busqueda: ASTERISCO | mix;
orden: ASTERISCO | DESC;
function: tipo_funcion PARENTA IDENTIFICADOR PARENTC;
mix: IDENTIFICADOR | function | IDENTIFICADOR COMA mix | function COMA mix;
condition: | WHERE where_conditions;
group: | GROUPBY IDENTIFICADOR;
order: | ORDERBY identificadores orden;
identificadores: IDENTIFICADOR | IDENTIFICADOR COMA identificadores;

%% 

int main(int argc, char* argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Uso: %s archivo.txt\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        fprintf(stderr, "No se pudo abrir el archivo %s\n", argv[1]);
        return 1;
    }

    yyparse();
    fclose(yyin);

    if (mistakes.size() > 0) {
        printf("\n\nIncorrecto\n\n");
        for (int numero_linea : mistakes) {
            printf("Error en la linea %d\n", numero_linea);
        }
        mistakes.clear();
    } else {
        printf("\n\nCorrecto\n");
    }

    return 0;
}

int yyerror(const char* mensaje) {
    return 1;
}
