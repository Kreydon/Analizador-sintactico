%{
    #include <iostream>
    #include <vector>

    using namespace std;

    int yylex();
    int yyerror(const char* s);
    extern "C" FILE* yyin;

    vector<int> mistakes;
    int numero_linea = 1;
%}

%token CREATETABLE
%token DROPTABLE
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
%token CONST_CADENA
%token ERROR

%%

start: comandos start_
start_: | comandos start
comandos: create_statement { numero_linea++; }
        | drop_statement { numero_linea++; }
        | insert_statement { numero_linea++; }
        | delete_statement { numero_linea++; }
        | update_statement { numero_linea++; }
        | select_statement { numero_linea++; }
        | error PUNTOYCOMA { mistakes.push_back(numero_linea++); }

create_statement: CREATETABLE IDENTIFICADOR PARENTA campos PARENTC PUNTOYCOMA;
campos: campo campos_;
campos_: | COMA campos;
campo: IDENTIFICADOR tipo_dato dato | IDENTIFICADOR tipo_dato;
tipo_dato: DATO_INTEGER | DATO_DECIMAL | DATO_VARCHAR;
dato: PARENTA DATO_INTEGER PARENTC;

drop_statement: DROPTABLE IDENTIFICADOR PUNTOYCOMA;

insert_statement: INSERT INTO IDENTIFICADOR VALUES PARENTA valores PARENTC PUNTOYCOMA;
valores: tipo_dato valores_;
valores_: | COMA valores;

delete_statement: DELETE FROM IDENTIFICADOR WHERE condiciones PUNTOYCOMA;
condiciones: condicion condiciones_;
condiciones_: | AND condiciones | OR condiciones; 
condicion: IDENTIFICADOR operador_ar tipo_dato | tipo_dato operador_ar IDENTIFICADOR;
operador_ar: ASIGNACION | DIFERENCIA | MAYORIQ | MENORIQ | MAYORQ | MENORQ | IGUALDAD;

update_statement: UPDATE IDENTIFICADOR SET IDENTIFICADOR IGUALDAD option WHERE condiciones PUNTOYCOMA;
option: IDENTIFICADOR | condiciones;

select_statement: SELECT busqueda FROM IDENTIFICADOR condicionado agrupacion ordenacion PUNTOYCOMA;
busqueda: ASTERISCO | combinado;
combinado: IDENTIFICADOR | funcion | IDENTIFICADOR COMA combinado | funcion COMA combinado;
funcion: tipoFuncion PARENTA IDENTIFICADOR PARENTC;
tipoFuncion: MAX | MIN | AVG | COUNT;
condicionado: | WHERE condiciones;
agrupacion: | GROUPBY IDENTIFICADOR;
ordenacion: | ORDERBY identificadores orden;
orden: ASTERISCO | DESC;
identificadores: IDENTIFICADOR | IDENTIFICADOR COMA identificadores;

%% 

int main(int argc, char* argv[]) {
    if (argc != 2) {
        cerr<<"Uso: "<<argv[0]<<" archivo.txt\n";
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        cerr<<"No se pudo abrir el archivo "<<argv[1]<<endl;
        return 1;
    }

    yyparse();
    fclose(yyin);

    if (mistakes.size() > 0) {
        cout<<"\n\nIncorrecto\n\n";
        for (int linea : mistakes) {
            cout<<"Error en la linea "<<linea<<endl;
        }
        mistakes.clear();
    } else {
        cout<<"\n\nCorrecto\n";
    }

    return 0;
}

int yyerror(const char* mensaje) {
    return 1;
}