
# Ejercicio 10 - Cuantificación y Distorsión

Este ejercicio implementa un cuantificador uniforme configurable en número de bits (Nbits) y analiza su efecto sobre una señal senoidal.

## Objetivo

- Cuantificar una señal senoidal de 440 Hz con distintos niveles de resolución (8, 4 y 2 bits).
- Comparar la señal original y la cuantificada en el dominio del tiempo.
- Analizar el error de cuantificación.
- Calcular la relación señal a ruido (SNR) teórica y aproximada.
- Visualizar el espectro de la señal original, cuantificada y del error.

## Descripción del Código

1. **Generación de señal**:
   - Onda senoidal de 440 Hz, amplitud 1.0, duración 2 segundos, muestreo a 44.1 kHz.

2. **Función `cuantificar()`**:
   - Aplica cuantificación uniforme según el número de bits especificado.

3. **Visualización**:
   - Para cada Nbits (8, 4, 2):
     - Se grafican la señal original, la cuantificada y el error (zoom a 10 ms).
     - Se calcula la SNR aproximada y se compara con la teórica.
     - Se grafican los espectros de la señal original, cuantificada y del error.

## Resultados Esperados

- A mayor número de bits, menor error de cuantificación y mayor SNR.
- El espectro del error muestra componentes adicionales que no están en la señal original.

## Aplicaciones

Este análisis es fundamental en procesamiento digital de señales, compresión de audio y diseño de sistemas de adquisición de datos.
