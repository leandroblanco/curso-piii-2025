# Análisis del Código: ejercicio12clase06mensaje.py

Este script implementa una modulación de amplitud de doble banda lateral (AM-DSB) utilizando una señal de mensaje compuesta por múltiples tonos entre 20 Hz y 2 kHz. A continuación se presenta un análisis detallado de cada sección del código.

## Objetivo

Simular una modulación AM básica con una señal de mensaje compleja (multitono) y visualizar su comportamiento en el dominio del tiempo y la frecuencia.

## Descripción del Código

### 1. Parámetros de Simulación
- `fs = 44100`: Frecuencia de muestreo en Hz.
- `T = 1`: Duración de la señal en segundos.
- `t`: Vector de tiempo generado con `np.linspace`.

### 2. Señal de Mensaje `m(t)`
- Compuesta por 10 tonos sinusoidales espaciados linealmente entre 20 Hz y 2000 Hz.
- Cada tono tiene amplitud 1.0.
- Se suman todas las componentes para formar una señal compleja.

### 3. Señal Portadora `c(t)`
- Frecuencia: 5000 Hz
- Amplitud: 10.0
- Generada como una onda sinusoidal simple.

### 4. Señal Modulada `y(t)`
- Fórmula: `y_t = (1 + m_t) * c_t`
- Esta fórmula representa una modulación AM-DSB, donde la señal de mensaje modula la amplitud de la portadora.

### 5. Visualización en el Tiempo
- Se grafican:
  - Señal de mensaje `m(t)`
  - Señal portadora `c(t)`
  - Señal modulada `y(t)`
- Todas las gráficas se muestran con zoom en los primeros 10 ms.

### 6. Visualización en Frecuencia
- Se calcula la FFT de `y(t)` para obtener su espectro.
- Se grafica hasta 8 kHz para observar las componentes espectrales relevantes.

## Observaciones

- La señal de mensaje multitono genera una envolvente compleja en la señal modulada.
- El espectro de la señal modulada muestra bandas laterales alrededor de la frecuencia portadora (5 kHz), correspondientes a cada tono del mensaje.

## Conclusión

Este ejercicio permite observar cómo una señal de mensaje compuesta por múltiples frecuencias modula una portadora en AM-DSB, y cómo se representa esta modulación en el dominio del tiempo y frecuencia.
