
# Ejercicio 3 - Señal Senoidal con Muestreo y Cuantificación

Este ejercicio genera una señal senoidal de 1 kHz con amplitud de ±5 V, la muestrea a 50 kHz y analiza:

1. La señal continua durante 10 ms.
2. Las primeras 50 muestras sin cuantificar.
3. Las mismas 50 muestras cuantificadas con un ADC de 3 bits.

## Objetivo

Visualizar el proceso de muestreo y cuantificación de una señal analógica, simulando el funcionamiento de un conversor analógico-digital (ADC).

## Descripción del Código

- Se define una señal senoidal de 1 kHz con amplitud de 5 V.
- Se muestrea a 50 kHz durante 10 ms.
- Se extraen las primeras 50 muestras.
- Se cuantifican usando un ADC de 3 bits (8 niveles).
- Se grafican:
  - La señal continua.
  - Las muestras sin cuantificar.
  - Las muestras cuantificadas.

## Cuantificación

- Se calcula la resolución del ADC como `rango / niveles`.
- Se aplica la fórmula de cuantificación:
  ```python
  senal_cuantificada = np.round((muestras + amplitud) / resolucion) * resolucion - amplitud
  ```

## Visualización

La gráfica muestra cómo la señal original se aproxima por niveles discretos, simulando el efecto de la digitalización.

## Aplicaciones

Este tipo de análisis es fundamental en sistemas de adquisición de datos, procesamiento digital de señales y electrónica.
