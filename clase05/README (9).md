
# Ejercicio 9 - Análisis de Audio Propio

Este ejercicio consiste en subir un archivo de audio personal y analizarlo mediante tres representaciones visuales:

1. **Forma de onda** (dominio del tiempo)
2. **Espectro de frecuencia** (FFT)
3. **Espectrograma** (frecuencia vs. tiempo)

## Objetivo

Explorar las características de un archivo de audio mediante visualización y análisis espectral.

## Descripción del Código

- Se utiliza `librosa` para cargar el archivo de audio.
- Se extraen propiedades clave:
  - Frecuencia de muestreo (`sr`)
  - Duración total en segundos
  - Número de canales (mono o estéreo)
- Se define la función `plot_tiempo_frecuencia_espectrograma()` que genera tres gráficos:
  - **Forma de onda**: amplitud vs. tiempo
  - **Espectro de frecuencia**: magnitud de la FFT
  - **Espectrograma**: representación tiempo-frecuencia usando escala mel

## Visualización

La función de ploteo permite observar:
- La estructura temporal del audio.
- Las frecuencias dominantes.
- Cómo varían las frecuencias a lo largo del tiempo.

## Aplicaciones

Este análisis es útil para:
- Reconocimiento de patrones acústicos
- Análisis musical
- Procesamiento de señales de voz

