%{
    #include <iostream>
    #include <vector>

    using namespace std;

    int yylex();
    int yyerror(const char* s);
    extern "C" FILE* yyin;

    vector<int> error_lineas;
    int numLinea = 1;
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
comandos: creacion_tabla { numLinea++; }
        | eliminacion_tabla { numLinea++; }
        | insercion_dato { numLinea++; }
        | eliminacion_dato { numLinea++; }
        | actualizacion { numLinea++; }
        | seleccion { numLinea++; }
        | error PUNTOYCOMA { error_lineas.push_back(numLinea++); }

creacion_tabla: CREATETABLE IDENTIFICADOR PARENTA campos PARENTC PUNTOYCOMA;
campos: campo campos_;
campos_: | COMA campos;
campo: IDENTIFICADOR tipoDato dato | IDENTIFICADOR tipoDato;
tipoDato: DATO_INTEGER | DATO_DECIMAL | DATO_VARCHAR;
dato: PARENTA DATO_INTEGER PARENTC;

eliminacion_tabla: DROPTABLE IDENTIFICADOR PUNTOYCOMA;

insercion_dato: INSERT INTO IDENTIFICADOR VALUES PARENTA valores PARENTC PUNTOYCOMA;
valores: valor valores_;
valores_: | COMA valores;
valor: DATO_INTEGER | DATO_DECIMAL | DATO_VARCHAR;

eliminacion_dato: DELETE FROM IDENTIFICADOR WHERE condiciones PUNTOYCOMA;
condiciones: condicion condiciones_;
condiciones_: | AND condiciones | OR condiciones; 
condicion: IDENTIFICADOR operador_ar valor | valor operador_ar IDENTIFICADOR;
operador_ar: ASIGNACION | DIFERENCIA | MAYORIQ | MENORIQ | MAYORQ | MENORQ | IGUALDAD;

actualizacion: UPDATE IDENTIFICADOR SET IDENTIFICADOR IGUALDAD option WHERE condiciones PUNTOYCOMA;
option: IDENTIFICADOR | condiciones;

seleccion: SELECT busqueda FROM IDENTIFICADOR condicionado agrupacion ordenacion PUNTOYCOMA;
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

    if (error_lineas.size() > 0) {
        cout<<"\n\nIncorrecto\n\n";
        for (int linea : error_lineas) {
            cout<<"Error en la linea "<<linea<<endl;
        }
        error_lineas.clear();
    } else {
        cout<<"\n\nCorrecto\n";
    }

    return 0;
}

int yyerror(const char* mensaje) {
    return 1;
}