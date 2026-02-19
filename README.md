# Quiz Flex - Números Complejos

Programa en Flex que reconoce números complejos de la forma:

a+bi

Donde:
- a y b pertenecen a los reales
- i puede ser i, I, j, J

## Compilación

```bash
flex complejos.l
gcc lex.yy.c -o complejos -lfl
./complejos entrada.txt
