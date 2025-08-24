
# Ejercicio 6 - Análisis de Espectros de Audio

Este proyecto consiste en la grabación y análisis espectral de dos sonidos:

1. Un tono puro de 440 Hz generado con un generador online.
2. La nota La4 (A4) grabada desde un piano virtual.

## Objetivo

Comparar los espectros de frecuencia de ambas grabaciones para observar las diferencias entre un tono puro y una nota musical real.

## Descripción del Código

El código realiza las siguientes tareas:

1. **Carga de archivos de audio**: Se utilizan funciones de Google Colab para subir los archivos `tono440Hz.wav` y `pianoLA4.wav`.
2. **Reproducción de audio**: Se utiliza `IPython.display.Audio` para escuchar los archivos.
3. **Procesamiento de audio**:
   - Se carga el archivo con `soundfile.read()`.
   - Si el audio es estéreo, se convierte a mono.
   - Se calcula el espectro de frecuencia mediante la Transformada Rápida de Fourier (FFT).
4. **Visualización**: Se grafica el espectro de frecuencia usando `matplotlib`.

## Comparación de Espectros

- **Tono puro de 440 Hz**:
  - El espectro muestra un único pico muy definido en 440 Hz.
  - No hay componentes armónicos adicionales.
  - Representa una onda senoidal ideal.

- **Nota La4 desde piano virtual**:
  - El espectro muestra un pico principal en 440 Hz, pero también varios picos secundarios.
  - Estos picos corresponden a los armónicos naturales del instrumento.
  - Refleja la riqueza tímbrica del piano, que incluye múltiples frecuencias además de la fundamental.

## Conclusión

La comparación entre ambos espectros permite observar cómo un instrumento musical real genera una señal más compleja que un tono puro. Esto se debe a la presencia de armónicos que enriquecen el sonido y le dan su carácter distintivo.

