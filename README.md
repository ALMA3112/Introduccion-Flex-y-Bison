# Flex-y-Bison
- Carlos Alberto Cardona Pulido.
- Lenguajes de programacion y transduccion.
- Profesor: Joaquin Sanchez.
## Introduccion
En este repositorio se desarrolla el primer capítulo de Flex y Bison, incluyendo la solución de los ejercicios propuestos, junto con un análisis detallado de los ejemplos presentados en el libro. Además, se documentan los comandos necesarios para ejecutar cada programa desde la terminal sin errores, las dificultades encontradas durante la ejecución de cada ejercicio o ejemplo, y se incluyen capturas de pantalla que evidencian los resultados obtenidos.

## Ejemplos
### Ejemplo1.
En este archivo [Ejemplo1](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejemplos/Ejemplo%201/fb1-1.l) el cual es un scanner sencillo escrito para **Flex**: cuenta  lineas, palbaras y caracteres. En la cabecera se inserta variables chars, words y lines, y en las reglas se tiene [a-zA-Z] la cual incrementa words y los suma **strlen(yytext)** a chars, \n incrementa chars y lines, y . incrementa chars para cualquier otro carácter. 
