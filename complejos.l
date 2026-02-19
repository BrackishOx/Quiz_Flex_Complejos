%{
#include <stdio.h>
%}

/* Definiciones */
DIGITO      [0-9]
SIGNO       [+-]?
ENTERO      {DIGITO}+
DECIMAL     {DIGITO}+\.{DIGITO}+
EXP         [eE][+-]?{DIGITO}+
REAL        {SIGNO}(({DECIMAL}|{ENTERO})({EXP})?)
IMAG        [iIjJ]

%%

^{REAL}[+-]{REAL}{IMAG}$    { printf("ACEPTA\n"); }
.*                          { printf("NO ACEPTA\n"); }

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Uso: ./complex archivo.txt\n");
        return 1;
    }

    FILE *archivo = fopen(argv[1], "r");
    if (!archivo) {
        printf("Error al abrir el archivo\n");
        return 1;
    }

    yyin = archivo;
    yylex();
    fclose(archivo);
    return 0;
}

int yywrap() {
    return 1;
}

