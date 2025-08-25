
# Ejercicio 8 - Comparación de Muestreo Sub-Nyquist y Sobre-Nyquist

Este ejercicio analiza el efecto del aliasing al muestrear una señal compuesta por tres frecuencias distintas (300 Hz, 800 Hz y 1500 Hz) a diferentes tasas de muestreo.

## Objetivo

- Generar una señal compuesta por varias frecuencias.
- Muestrearla a distintas frecuencias: inferior, igual y superior al doble de la frecuencia máxima (Nyquist).
- Visualizar los efectos del aliasing en el dominio del tiempo y frecuencia.

## Descripción del Código

1. **Generación de señal compuesta**:
   - Se suman tres senoidales de 300 Hz, 800 Hz y 1500 Hz.
   - Se genera a una frecuencia de muestreo alta (44100 Hz).

2. **Remuestreo**:
   - Se utiliza `scipy.signal.resample` para obtener versiones de la señal a:
     - Sub-Nyquist: 750 Hz
     - Límite de Nyquist: 3000 Hz
     - Sobre-Nyquist: 7500 Hz
     - Original: 44100 Hz

3. **Visualización**:
   - Se grafica cada señal en el dominio del tiempo (zoom a 20 ms).
   - Se calcula y grafica la FFT hasta 2 kHz.


Estos gráficos muestran una señal compuesta por tres ondas sinusoidales con  recuencias de 300 Hz, 800 Hz y 1500 Hz, muestreada a diferentes frecuencias. Cada par de gráficos (dominio del tiempo y FFT) corresponde a una frecuencia de muestreo diferente.

Original Signal (fs=44100 Hz): Este es el gráfico de la señal original muestreada a una alta frecuencia (44100 Hz), muy por encima de la frecuencia de Nyquist para esta señal compuesta. En el dominio del tiempo, se puede observar claramente la forma de onda compleja resultante de la suma de las tres sinusoides. En la FFT, se ven picos nítidos y distintos en las frecuencias de 300 Hz, 800 Hz y 1500 Hz, lo que indica que la señal original está bien representada y no hay pérdida de información de frecuencia.

Sub-Nyquist (fs=750.0 Hz): Aquí, la señal se muestrea a 750 Hz, que está por debajo de la frecuencia de Nyquist (3000 Hz) para el componente de frecuencia más alta (1500 Hz). En el dominio del tiempo, la forma de onda se ve distorsionada y no representa fielmente la señal original. En la FFT, además de los picos en las frecuencias originales (aunque posiblemente con amplitudes alteradas), pueden aparecer picos adicionales a frecuencias que no estaban en la señal original. Este fenómeno se conoce como aliasing y ocurre cuando la frecuencia de muestreo es demasiado baja para capturar correctamente los componentes de alta frecuencia de la señal, haciendo que parezcan frecuencias más bajas.

Nyquist Limit (fs=3000 Hz): La señal se muestrea a 3000 Hz, que es exactamente el doble de la frecuencia más alta en la señal original (1500 Hz), es decir, la frecuencia de Nyquist. En teoría, muestrear a la frecuencia de Nyquist es suficiente para reconstruir una señal, siempre y cuando la señal no tenga componentes de frecuencia exactamente en la mitad de la frecuencia de muestreo. En el dominio del tiempo, la forma de onda comienza a parecerse más a la original que en el caso sub-Nyquist, aunque aún puede haber algunas distorsiones. En la FFT, deberías ver los picos en las frecuencias originales, con un aliasing mínimo o nulo para los componentes dentro de este límite.

Over-Nyquist (fs=7500 Hz): La señal se muestrea a 7500 Hz, que está por encima de la frecuencia de Nyquist. Similar al caso de 44100 Hz, en el dominio del tiempo, la forma de onda se acerca más a la señal original. En la FFT, los picos en las frecuencias originales son claros y no debería haber aliasing significativo. Muestrear por encima de la frecuencia de Nyquist evita el aliasing y permite una representación precisa de la señal.

f_max (fs=1500 Hz): Este gráfico muestra la señal muestreada a 1500 Hz, que es igual a la frecuencia más alta presente en la señal original. En el dominio del tiempo, la forma de onda está significativamente distorsionada debido a que la frecuencia de muestreo es igual a uno de los componentes de la señal. En la FFT, es probable que solo veas el pico en 300 Hz y 800 Hz, y el pico de 1500 Hz podría ser muy bajo o ausente, o incluso aparecer como aliasing en otra frecuencia, ya que la frecuencia de muestreo no es suficiente para representar correctamente la componente de 1500 Hz.

En resumen, estos gráficos ilustran el Teorema de Muestreo de Nyquist-Shannon, que establece que para reconstruir perfectamente una señal analógica a partir de sus muestras digitales, la frecuencia de muestreo debe ser al menos el doble de la frecuencia más alta presente en la señal (la frecuencia de Nyquist). Cuando la frecuencia de muestreo es menor que la frecuencia de Nyquist, se produce el aliasing, que distorsiona el espectro de frecuencia y la forma de onda de la señal muestreada. Muestrear por encima de la frecuencia de Nyquist evita el aliasing y permite una representación precisa de la señal.



## Análisis de Aliasing

- **Señal original (44100 Hz)**: Representación precisa de las tres frecuencias.
- **Sub-Nyquist (750 Hz)**: Se observa aliasing, las frecuencias se mezclan y distorsionan.
- **Límite de Nyquist (3000 Hz)**: Representación aceptable, pero con riesgo de aliasing si hay componentes en el límite.
- **Sobre-Nyquist (7500 Hz)**: Representación clara y sin aliasing.

## Conclusión

Este ejercicio demuestra el Teorema de Muestreo de Nyquist-Shannon, que establece que para evitar aliasing, la frecuencia de muestreo debe ser al menos el doble de la frecuencia más alta presente en la señal.
