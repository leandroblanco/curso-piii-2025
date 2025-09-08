
# Explicación del Código: ejercicio16clase08.py

Este script realiza una simulación de transmisión de señales utilizando modulación PAM4 y filtros de transmisión. A continuación se detalla cada sección del código:

## 1. Filtro Transmisor
Se genera un filtro de transmisión `g[n]` utilizando una función sinc modificada con un factor de roll-off `alpha`. Este filtro se utiliza para modelar la forma de los pulsos transmitidos.

- `fB = 32e9`: Velocidad de símbolos (32 GBaud).
- `T = 1 / fB`: Tiempo entre símbolos.
- `M = 8`: Factor de sobremuestreo.
- `fs = fB * M`: Frecuencia de muestreo.
- `alpha = 0.1`: Factor de roll-off.
- `L = 20`: Define la longitud del filtro.
- `gn`: Filtro generado con la fórmula de sinc modificada.

Se grafica el filtro `g[n]` usando `matplotlib`.

## 2. Generación de Símbolos PAM4
Se generan 1000 símbolos aleatorios de la modulación PAM4, que toma valores en {-3, -1, 1, 3}. Se utiliza una semilla basada en el tiempo actual para asegurar aleatoriedad.

## 3. Secuencia Extendida
Se crea una secuencia extendida `x[n]` donde los símbolos se colocan cada `M` muestras, y el resto se rellena con ceros. Esto simula la transmisión de símbolos discretos.

## 4. Convolución con el Filtro
La secuencia extendida `x[n]` se filtra mediante convolución con `g[n]`, generando la señal `s[n]` que representa la forma de onda transmitida.

## 5. Diagrama de Ojo para PAM4
Se grafica el diagrama de ojo, que permite visualizar la calidad de la señal y la separación entre niveles de PAM4. Se utiliza un retardo `d = 4` para centrar el ojo.

Se grafican múltiples segmentos de la señal `s[n]` para observar la superposición de símbolos y evaluar la apertura del ojo.

## Análisis de Resultados
- El filtro `g[n]` muestra una forma de pulso con roll-off controlado.
- La secuencia extendida permite observar cómo se ubican los símbolos en el tiempo.
- La convolución genera una señal continua que simula la transmisión real.
- El diagrama de ojo muestra claramente los niveles de PAM4 y permite evaluar la interferencia entre símbolos.

Este tipo de simulación es fundamental en comunicaciones digitales para diseñar y evaluar sistemas de transmisión.
