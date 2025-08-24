
# Ejercicio 2 - Visualización de Coseno con Recorte de Negativos

Este ejercicio consiste en calcular los primeros 50 valores de la función coseno evaluada en puntos discretos, y modificar la señal para que todos los valores negativos se reemplacen por cero.

## Objetivo

Visualizar cómo se comporta la función coseno en un intervalo discreto y cómo se modifica al eliminar sus valores negativos.

## Descripción del Código

- Se genera un arreglo `n` con los primeros 50 números enteros.
- Se calcula `y = cos(n * π / 10)`, lo que genera una señal periódica.
- Se aplica `clip(min=0)` para reemplazar los valores negativos por cero, obteniendo `y_no_neg`.
- Se grafica la señal modificada con `matplotlib`, mostrando los puntos y una línea horizontal en cero para referencia.

## Visualización

La gráfica muestra claramente cómo la señal coseno se ve afectada por el recorte de negativos:
- Las partes de la señal que originalmente eran negativas ahora aparecen como cero.
- Esto puede interpretarse como una forma de rectificación parcial de la señal.

## Aplicaciones

Este tipo de procesamiento es útil en sistemas de señal donde se desea eliminar componentes negativos, como en rectificadores de media onda en electrónica.

