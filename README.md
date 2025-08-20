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

![Imagen2](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Imagenes/Captura%20desde%202025-08-19%2019-50-16.png) 

Este codigo ejecuto de forma correcta sin ninguna novedad. 

### Ejemplo 3.
EL archivo [Ejemplo3](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejemplos/Ejemplo%203/fb1-3.l) implementa un analizador léxico que no solo permite copiar el texto de entrada o realizar sustituciones específicas, sino que además está preparado para reconocer números enteros, lo que amplía su capacidad de análisis frente a versiones más básicas. Esto se logra mediante la inclusión de una regla que identifica secuencias de dígitos y las procesa de manera explícita, diferenciándolas del resto de caracteres comunes. Un aspecto clave de este ejercicio es la adición de la función main, que convierte al archivo en un programa autónomo y ejecutable. En esta función se invoca a yylex(), lo que asegura que el flujo de ejecución inicie leyendo la entrada, aplique las reglas definidas y finalice correctamente al terminar el procesamiento. Con esta estructura, el código no depende de archivos externos para funcionar, y además adquiere mayor versatilidad al poder reconocer tanto texto como números dentro de la misma ejecución. La compilación y ejecución son idénticas a las del Ejemplo1; únicamente cambia el nombre del archivo a fb1-3.l.

![Imagen3](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Imagenes/Captura%20desde%202025-08-19%2020-14-41.png) 

La ejecucion de este programa tambien se hizo sin niguna novedad.

### Ejemplo 4. 
El codigo implementando en Flex [Ejemplo4](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejemplos/Ejemplo%204/fb1-4.l) define un analizador léxico encargado de reconocer los diferentes tokens de una calculadora básica. En la sección de definiciones se declara un enumerado que asigna identificadores numéricos a los operadores y símbolos que se van a reconocer, como suma, resta, multiplicación, división, valor absoluto, números y fin de línea. Posteriormente, en la sección de reglas, se especifica cómo deben identificarse estos tokens en la entrada: los caracteres +, -, *, / y | se traducen en sus respectivos operadores, mientras que las secuencias de dígitos se convierten en números enteros que se almacenan en la variable yylval. Además, se maneja el salto de línea como fin de instrucción y se ignoran los espacios y tabulaciones. Para cualquier carácter no reconocido se imprime un mensaje de advertencia. Finalmente, en la función main, se ejecuta un ciclo que invoca repetidamente a yylex() para leer los tokens de la entrada, mostrando por pantalla el código del token correspondiente, y en el caso de los números también su valor entero. De esta forma, el programa constituye la primera fase de un compilador o intérprete: la análisis léxico, donde la entrada se convierte en una secuencia de símbolos significativos.

Los comandos de ejecucion siguen siendo los mismos y lo unico que cambia es el nombre del archivo fb1-4.l

![Imagen 4](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Imagenes/Captura%20desde%202025-08-19%2022-38-18.png)

La ejecucion de este programa tambien se hizo sin niguna novedad.

### Ejemplo 5
El código presentado en los archivos [fb1-5.l](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejemplos/Ejemplo%205/fb1-5.l) y [fb1-5.y](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejemplos/Ejemplo%205/fb1-5.y) implementa un pequeño compilador de una calculadora mediante la combinación de Flex y Bison. El archivo léxico (fb1-5.l) se encarga de identificar los diferentes símbolos de la entrada, como los operadores aritméticos (+, -, *, /), el operador de valor absoluto (|), los números enteros y los saltos de línea, asignándoles un token definido en el archivo sintáctico. Por su parte, el archivo de gramática (fb1-5.y) define las reglas sintácticas que permiten reconocer expresiones aritméticas y calcular sus resultados respetando la jerarquía de operaciones: primero factores (multiplicación y división), luego expresiones con suma y resta, y finalmente términos como números o valores absolutos. La acción semántica asociada a cada producción evalúa la operación y devuelve el resultado, el cual se imprime al detectar el fin de una expresión. En conjunto, ambos módulos forman un sistema que primero realiza el análisis léxico para transformar la entrada en tokens, y luego el análisis sintáctico y semántico para construir y evaluar la expresión aritmética. De este modo, el programa ejemplifica cómo se integran las fases de un compilador para procesar y ejecutar instrucciones.

En este ejemplo los comandos si cambiam.
 ```
  bison -d fb1-5.y
  flex fb1-5.l
  gcc fb1-5.tab.c lex.yy.c -lfl -o fb1-5
  ./fb1-5
 ```
NO se tuvo en cuenta el comando que esta en el libro para el lex, ya que a la hora de ejecutarlo en terminal presentaba un error. Por esta razon se tuvieron en cuenta buscar por aparte y con el comando que esta ahi se ejecuto de forma correcta sin cambiar el codigo. En este ejercicio este fue el unico percanse que se tuvo y dificultad a la hora ejecutar el codigo en la terminal. 

La ejecucion del codigo se ve de la sigueinte manera: 

![Imagen5](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Imagenes/Captura%20desde%202025-08-19%2022-55-55.png)

## Ejercicios
### Ejercicio 1.
En comparación con la versión anterior de la calculadora, en los archivos [Ejercicio1.y](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejercicios/Ejercicio1/Ejercicio1.y) y [Ejercicio1.l](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejercicios/Ejercicio1/Ejercicio1.l) se introdujo un cambio importante: la incorporación del token COMMENT para reconocer comentarios en la entrada. En el analizador léxico (Ejercicio1.l), se agregó la regla "//".* que permite identificar cualquier línea que comience con // y marcarla como comentario. Por su parte, en el analizador sintáctico (Ejercicio1.y), se amplió la gramática con una nueva producción dentro de line, la cual acepta un COMMENT seguido de un salto de línea y lo ignora, es decir, no genera ninguna acción de cálculo. Gracias a esta modificación, la calculadora ahora puede recibir líneas de comentarios sin generar errores léxicos ni sintácticos, lo que representa una mejora respecto a la versión previa que no contemplaba este caso y trataba dichos caracteres como “misteriosos”.

Respuestas a las preguntas:
- ¿La calculadora aceptará una línea que contenga solo un comentario?

Sí, en esta nueva versión lo hace. Antes no era posible porque ni el escáner ni el parser reconocían comentarios como una unidad válida, y por lo tanto generaban errores.

- ¿Por qué antes no lo hacía?

Porque la gramática anterior solo contemplaba expresiones, números, operadores y saltos de línea, sin dar un significado a secuencias como // texto. El analizador léxico simplemente detectaba caracteres no reconocidos y los reportaba como errores.

- ¿Sería más fácil corregir esto en el escáner o en el parser?


En este caso resulta más sencillo modificar el escáner, ya que los comentarios no son tokens relevantes para la semántica de la expresión: basta con que el analizador léxico los identifique y los ignore o los traduzca a un token COMMENT que el parser descarte. Esto evita complicar innecesariamente la gramática y mantiene el diseño más limpio.

Ejecucion: 

![Imagen6](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Imagenes/Captura%20desde%202025-08-19%2023-16-02.png)

### Ejercicio 2. 
En esta nueva versión de la calculadora, respecto al Ejercicio1, se introdujeron cambios tanto en el analizador léxico como en el sintáctico. En el archivo [Ejercicio2.l](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejercicios/Ejercicio2/Ejercicio2.l), además de seguir reconociendo números decimales, se añadió una nueva regla para aceptar números en formato hexadecimal (0x o 0X seguidos de dígitos hexadecimales). Para ello se utilizó la función strtol de la librería estándar de C, que permite convertir la cadena leída en su equivalente entero. Por su parte, en el archivo [Ejercicio2.y](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Ejercicios/Ejercicio2/Ejercicio2.y), se modificó la acción asociada a la producción line para que, al mostrar el resultado de una expresión, además de imprimir el valor en decimal, también lo haga en representación hexadecimal usando el especificador %#lx. Con estas modificaciones, la calculadora ahora no solo evalúa expresiones aritméticas con números decimales, sino que también reconoce y procesa valores hexadecimales, mostrando el resultado en ambas bases. En síntesis, el cambio principal frente al Ejercicio1 es la extensión de la calculadora hacia el manejo de distintas bases numéricas, ampliando sus capacidades de análisis léxico y semántico.

Ejecucion: 

![Image2](https://github.com/ALMA3112/Introduccion-Flex-y-Bison/blob/main/Imagenes/Captura%20desde%202025-08-19%2023-26-42.png)
