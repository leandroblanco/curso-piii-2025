
# Ejercicio 1 - Modulación en Amplitud (AM)

Este módulo genera y grafica tres señales:

1. **Señal Portadora**: una onda sinusoidal de alta frecuencia.
2. **Señal Moduladora**: una onda sinusoidal de baja frecuencia que controla la amplitud de la portadora.
3. **Señal Modulada en Amplitud (AM)**: resultado de multiplicar la portadora por la moduladora escalada.

## Objetivo

Visualizar cómo la señal moduladora afecta la amplitud de la señal portadora, generando una señal modulada en amplitud.

## Descripción del Código

- Se define la función `plot_modulated_signal()` que recibe:
  - `carrier_freq`: frecuencia de la portadora.
  - `modulating_freq`: frecuencia de la moduladora.
  - `sampling_rate`: tasa de muestreo.
  - `duration`: duración de la señal.
  - `modulation_index`: índice de modulación (controla la profundidad de la modulación).

- Se generan las tres señales:
  - La **portadora** es una onda coseno de alta frecuencia.
  - La **moduladora** es una onda coseno de baja frecuencia, desplazada para ser siempre positiva.
  - La **modulada** se obtiene multiplicando la portadora por la moduladora escalada.

- Se grafican las tres señales en subplots separados para facilitar la comparación visual.

## Ejemplo de Uso

```python
plot_modulated_signal(carrier_freq=100, modulating_freq=10, sampling_rate=1000, duration=1, modulation_index=0.8)
```

Este ejemplo genera una señal portadora de 100 Hz modulada por una señal de 10 Hz con un índice de modulación de 0.8.

## Conclusión

La modulación en amplitud permite transmitir información (como audio) sobre una señal portadora de alta frecuencia. Este ejercicio ilustra visualmente cómo se construye una señal AM.
