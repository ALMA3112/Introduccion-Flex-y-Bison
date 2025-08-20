# Flex-y-Bison
- Carlos Alberto Cardona Pulido.
- Lenguajes de programacion y transduccion.
- Profesor: Joaquin Sanchez.
## Introduccion
En este repositorio se desarrolla el primer capítulo de Flex y Bison, incluyendo la solución de los ejercicios propuestos, junto con un análisis detallado de los ejemplos presentados en el libro. Además, se documentan los comandos necesarios para ejecutar cada programa desde la terminal sin errores, las dificultades encontradas durante la ejecución de cada ejercicio o ejemplo, y se incluyen capturas de pantalla que evidencian los resultados obtenidos.

## Ejemplos
### Ejemplo1.
Este archivo [Ejemplo1](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejemplos/Ejemplo%201/fb1-1.l)  es un scanner sencillo escrito para **Flex** cuya funcion es contar lineas, palabaras y caracteres. En la seccion de cabecera declara las variables chars, wors y lines que almacenan los contadores y en las reglas se usa la expresion [a-zA-Z]+ para reconocer palabras  en donde cada coincidencias incrementa words y suma **strlen(yytext)** a chars, la regla \n incrementa lines y tambien chars, y una regla . captura cualquier otro carater menos los saltos de lines incrementando chars para cubrir espacios, puntuaciones y simbolos. 
  ```
    flex fb1-1.l
    cc lex.yy.c -lfl
    ./a.out
  ```
La ejecucion se ve de la siguiente manera:

![Imagen1](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Imagenes/Captura%20desde%202025-08-19%2019-22-18.png) 

Este codigo ejecuto de forma correcta sin ninguna novedad. 

### Ejemplo2.
El archivo [Ejemplo2](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejemplos/Ejemplo%202/fb1-2.l) realiza sustituciones palabra por palabra: contiene reglas literales que reemplazan determinados términos en inglés por sus equivalentes, mientras que una regla . copia cualquier otro carácter para que el resto del texto permanezca igual. Las coincidencias son sensibles a mayúsculas y minúsculas (case-sensitive) y se aplican en una sola pasada sobre la entrada es decir, las sustituciones no se reescanean. La compilación y ejecución son idénticas a las del Ejemplo1; únicamente cambia el nombre del archivo a fb1-2.l.

![Imagen2](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/commit/9d1337d499a787445c732d9e98a0b89b415569f5) 

Este codigo ejecuto de forma correcta sin ninguna novedad. 

### Ejemplo 3.
EL archivo 
