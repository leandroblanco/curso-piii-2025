
# Ejercicio 11 - Clase 5

Este proyecto consiste en la captura, procesamiento y análisis de una señal de audio utilizando un filtro de media móvil exponencial. El objetivo principal es observar cómo diferentes valores del parámetro de suavizado (`alpha`) afectan la señal en el dominio del tiempo y de la frecuencia.

## Descripción del Código

1. **Carga de Audio**: Se carga un archivo de audio (`pianoLA4.wav`) y se convierte a mono si es necesario.
2. **Filtro de Media Móvil Exponencial**: Se define una función que aplica este filtro a la señal de audio.
3. **Aplicación del Filtro**: Se aplica el filtro con tres valores distintos de `alpha`: 0.6, 0.2 y 0.05.
4. **Visualización Temporal**: Se grafican las señales originales y filtradas para observar el efecto del suavizado.
5. **Análisis de Frecuencia**: Se calcula la Transformada Rápida de Fourier (FFT) de las señales y se visualiza el espectro de frecuencia.

## Análisis

- El filtro de media móvil exponencial atenúa las componentes de alta frecuencia.
- A medida que el valor de `alpha` disminuye, el suavizado aumenta.
- Esto se observa tanto en el dominio del tiempo (señal más suave) como en el dominio de la frecuencia (menor magnitud en frecuencias altas).

## Resultados

- **Alpha = 0.6**: Suavizado moderado, conserva más detalles de la señal original.
- **Alpha = 0.2**: Suavizado más fuerte, reducción significativa de ruido.
- **Alpha = 0.05**: Suavizado extremo, pérdida de detalles finos.

Los gráficos generados permiten comparar visualmente el efecto del filtro en cada caso, mostrando cómo se modifica la forma de onda y el espectro de frecuencia.

---

Este análisis es útil para comprender el comportamiento de filtros digitales simples y su impacto en señales reales como el audio.
