%{
#include <stdio.h>
#include <string.h>
%}

DIGITO      [0-9]
SIGNO       [+-]
ESP         [ \t]*
ENTERO      {DIGITO}+
DECIMAL     {DIGITO}+\.{DIGITO}+
EXP         [eE][+-]?{DIGITO}+
REALNUM     ({DECIMAL}|{ENTERO})({EXP})?
REAL        {SIGNO}?{REALNUM}
IMAG        [iIjJ]

%%

^{ESP}{REAL}{ESP}{SIGNO}{ESP}{REALNUM}{IMAG}{ESP}\n   { printf("ACEPTA\n"); }

^{ESP}{REALNUM}{IMAG}{ESP}\n                          { printf("ACEPTA\n"); }

^{ESP}{REAL}{ESP}\n                                   { printf("ACEPTA\n"); }

^{ESP}\n                                              { /* línea vacía */ }

^.*\n                                                 { printf("NO ACEPTA\n"); }

%%

int main(int argc, char *argv[]) {

    if (argc != 2) {
        printf("Uso: ./complejos archivo.txt\n");
        return 1;
    }

    yyin = fopen(argv[1], "r");

    if (!yyin) {
        printf("Error al abrir el archivo\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}

