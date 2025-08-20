# Flex-y-Bison
- Carlos Alberto Cardona Pulido.
- Lenguajes de programacion y transduccion.
- Profesor: Joaquin Sanchez.
## Introduccion
En este repositorio se desarrolla el primer capítulo de Flex y Bison, incluyendo la solución de los ejercicios propuestos, junto con un análisis detallado de los ejemplos presentados en el libro. Además, se documentan los comandos necesarios para ejecutar cada programa desde la terminal sin errores, las dificultades encontradas durante la ejecución de cada ejercicio o ejemplo, y se incluyen capturas de pantalla que evidencian los resultados obtenidos.

## Ejemplos
### Ejemplo1.
En este archivo [Ejemplo1](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejemplos/Ejemplo%201/fb1-1.l)  es un scanner sencillo escrito para **Flex** cuya funcion es contar lineas, palabaras y caracteres. En la seccion de cabecera declara las variables chars, wors y lines que almacenan los contadores y en las reglas se usa la expresion [a-zA-Z]+ para reconocer palabras  en donde cada coincidencias incrementa words y suma **strlen(yytext)** a chars, la regla \n incrementa lines y tambien chars, y una regla . captura cualquier otro carater menos los saltos de lines incrementando chars para cubrir espacios, puntuaciones y simbolos. 
  ```
    flex fb1-1.l
    cc lex.yy.c -lfl
    ./a.out
  ```
La ejecucion se veria de la siguiente manera:
![Imagen1](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Imagenes/Captura%20desde%202025-08-19%2019-22-18.png) 

Este codigo ejecuto de forma correcta sin ninguna novedad. 
