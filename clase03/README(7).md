
# Ejercicio 7 - Clase 03

Este proyecto tiene como objetivo visualizar y analizar la función sinc, tanto en su forma continua como muestreada, utilizando Python y la biblioteca Matplotlib. Además, se incluye la visualización de una imagen relacionada con el tema.

## 📦 Requisitos

- Python 3
- Matplotlib
- NumPy

## 🚀 Cómo ejecutar

1. Instalar las dependencias necesarias:
   ```bash
   pip install matplotlib numpy
   ```
2. Ejecutar el script `ejericio7clase03.py` en un entorno compatible (por ejemplo, Google Colab o Jupyter Notebook).

## 📚 Descripción del código

### 1. Visualización de imagen
Se carga una imagen llamada `sync.png` y se muestra sin ejes utilizando `matplotlib.image`.

### 2. Función sinc continua
Se define la función sinc modificada:
```python
sinc(x) = 8 * sin(0.125 * π * x) / (0.125 * π * x)
```
con un tratamiento especial para el caso `x = 0`, donde se devuelve 1 o 8 según la versión del código.

Se grafica esta función en un rango continuo de valores entre -32 y 32 para observar su comportamiento.

### 3. Función sinc muestreada
Se grafica la misma función pero muestreada cada 1 unidad. Esto permite comparar la versión continua con la discreta, utilizando `plt.stem` para representar los puntos muestreados.

## 📈 Resultados esperados

- Visualización de la imagen `sync.png`.
- Gráfico de la función sinc continua.

figure: images/sinc_generada.png

- Gráfico comparativo entre la función sinc continua y su versión muestreada.

## 🔗 Fuente original
Este script fue generado automáticamente desde un notebook de Google Colab:
[Ver notebook](https://colab.research.google.com/drive/1iKhVgj6LUqzIeJFATMCl6CJK48sLbf2i)

## 👤 Autor
Leandro
