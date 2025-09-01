
# Análisis del Código: ejercicio15clase07.py

## Tema: Pulsación Acústica (Beats)
La pulsación es un fenómeno acústico que ocurre cuando dos ondas de frecuencias cercanas se combinan. El resultado es una señal cuya amplitud varía periódicamente, lo que se percibe como una fluctuación en el volumen del sonido.

## Descripción del Código
Este script genera, visualiza y analiza señales acústicas para estudiar el fenómeno de pulsación:

1. **Generación de señales**: Se crean dos ondas sinusoidales con frecuencias ligeramente distintas (440 Hz y 442 Hz).
2. **Suma de señales**: Se suman ambas señales para producir la señal de pulsación.
3. **Visualización**: Se grafica un fragmento de la señal para observar las oscilaciones.
4. **Reproducción de audio**: Se reproduce la señal para escuchar el efecto.
5. **Cálculo de frecuencia de batido**: Se calcula como la diferencia entre las dos frecuencias.
6. **Comparación perceptual**: Se compara el efecto entre frecuencias cercanas (440 vs 442 Hz) y más alejadas (440 vs 450 Hz).
7. **Multiplicación de señales**: Se realiza una modulación de amplitud (AM), generando componentes en la suma y diferencia de frecuencias.
8. **Análisis espectral**: Se aplica FFT para visualizar el espectro de frecuencias.

## Fundamentos Matemáticos
- **Frecuencia de batido**:
  \[ f_{beat} = |f_1 - f_2| \]

- **Modulación AM**:
  \[ \cos(2\pi f_1 t) \cdot \cos(2\pi f_2 t) = rac{1}{2}[\cos(2\pi(f_1 - f_2)t) + \cos(2\pi(f_1 + f_2)t)] \]

Esto muestra cómo la multiplicación de dos señales sinusoidales genera componentes en la suma y diferencia de sus frecuencias.

## Observaciones sobre la Percepción Auditiva
- Cuando las frecuencias están muy próximas, se perciben pulsaciones lentas y claras.
- Cuando están más alejadas, se percibe una disonancia o aspereza.


