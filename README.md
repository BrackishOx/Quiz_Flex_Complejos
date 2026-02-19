# Quiz Flex - Números Complejos

Programa en Flex que reconoce números complejos de la forma:

a+bi

Donde:
- a y b pertenecen a los reales
- i puede ser i, I, j, J

## Compilación

```bash
flex complex.l
gcc lex.yy.c -o complex -lfl
./complex entrada.txt
