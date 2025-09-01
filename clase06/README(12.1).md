# Ejercicio 12 - Modulación AM (AM-DSB)

Este proyecto implementa una modulación de amplitud de doble banda lateral (AM-DSB) utilizando Python. El objetivo es observar cómo se comporta una señal modulada en el dominio del tiempo y la frecuencia, y cómo varía con diferentes índices de modulación.

## Descripción del Código

El archivo `ejercicio12clase06.py` realiza los siguientes pasos:

1. **Configuración de parámetros**:
   - Frecuencia de muestreo: `fs = 441000 Hz`
   - Tiempo de simulación: `10 ms`

2. **Generación de señales**:
   - Señal de mensaje `m(t)`: seno de 200 Hz con amplitud inicial `Am = 0.7`
   - Señal portadora `c(t)`: seno de 5 kHz con amplitud `Ac = 1.0`

3. **Modulación AM**:
   - Se calcula la señal modulada como:
     ```python
     y_t = (1 + m_t) * c_t
     ```
   - Esta fórmula asegura que la envolvente de la señal modulada siga la forma de la señal de mensaje.

4. **Visualización**:
   - Se grafican:
     - Señal de mensaje en el tiempo
     - Señal portadora con zoom
     - Señal modulada
     - Espectro de la señal modulada (FFT hasta 8 kHz)

5. **Experimentación**:
   - Se sugiere modificar la amplitud `Am` para observar distintos índices de modulación.
   - Cuando `Am > 1`, se produce sobremodulación, lo que genera distorsión en la envolvente.

## Recomendaciones para Pruebas

Para probar distintos índices de modulación, modifica la línea:
```python
Am = 0.7  # Cambiar a 1.0 o 1.5 para observar efectos
```
Y vuelve a ejecutar las líneas que generan `m_t`, `y_t` y los gráficos.

## Observaciones

- **Índice de modulación < 1**: la envolvente es clara y sigue la forma de la señal de mensaje.
- **Índice de modulación = 1**: se alcanza el límite de modulación sin distorsión.
- **Índice de modulación > 1**: aparece sobremodulación, donde la envolvente se distorsiona y puede cruzar el eje cero, dificultando la demodulación.

---

Este ejercicio es útil para comprender los fundamentos de la modulación AM y cómo se representa en el dominio del tiempo y frecuencia.
