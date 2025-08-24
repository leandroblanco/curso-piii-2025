
# Ejercicio 4 - Generación y Reproducción de Escalas Musicales

Este ejercicio consiste en generar tonos musicales utilizando ondas senoidales y construir dos escalas:

1. **Escala Mayor de La**
2. **Escala Pentatónica Menor de La**

## Objetivo

Explorar la síntesis de audio digital mediante la generación de tonos senoidales y reproducir escalas musicales en una notebook.

## Descripción del Código

- Se define una función `generador_de_tono()` que genera una onda senoidal de una frecuencia dada.
- Se genera un tono de 440 Hz (La4) como ejemplo.
- Se construyen las frecuencias de las 13 notas cromáticas a partir de La4 usando la fórmula:
  ```python
  frecuencia = 440 * 2**(n / 12)
  ```
- Se seleccionan las notas correspondientes a:
  - **Escala Mayor de La**: índices `[0, 2, 4, 5, 7, 9, 11, 12]`
  - **Escala Pentatónica Menor de La**: índices `[0, 3, 5, 7, 10, 12]`
- Se concatenan las muestras de cada nota para formar la escala completa.
- Se reproducen ambas escalas usando `IPython.display.Audio`.

## Visualización y Audio

Aunque no se generan gráficos, el código permite escuchar las escalas directamente en la notebook.

## Aplicaciones

Este tipo de ejercicios es útil para:
- Introducción a la síntesis de audio.
- Comprensión de la construcción de escalas musicales.
- Aplicaciones en música digital y procesamiento de señales.
