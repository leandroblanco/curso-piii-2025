# Cuantificación de Señal Analógica con ADC de 3 Bits

Este proyecto muestra cómo cuantificar una señal analógica utilizando un convertidor analógico-digital (ADC) de 3 bits. La señal de entrada es una onda senoidal con una amplitud de 4V y un offset de 4V, lo que la sitúa completamente en el rango de 0V a 8V. Este rango coincide con el rango de referencia del ADC, permitiendo una cuantificación precisa en **8 niveles** (de 0V a 8V en pasos de 1V).

## 🧠 ¿Qué hace el código?

1. **Genera una señal senoidal** con offset positivo.
2. **Cuantifica la señal** en 8 niveles usando una función personalizada.
3. **Grafica la señal original y la cuantificada**, mostrando visualmente cómo los valores se ajustan a los niveles discretos del ADC.

## ⚙️ Parámetros clave

- **Bits del ADC**: 3 bits → 8 niveles
- **Rango de referencia**: 0V a 8V
- **Paso de cuantificación**: 1V
- **Señal de entrada**: `4 * sin(2π * 5t) + 4`

## 📁 Archivos

- `main.py`: Código fuente con la lógica de generación y cuantificación.

## 🧪 Aplicaciones

Este ejemplo es útil para entender cómo funciona la cuantificación en sistemas digitales, especialmente en electrónica y procesamiento de señales. Es ideal para estudiantes, docentes o entusiastas que quieran visualizar el efecto de discretizar una señal continua.



# Ejercicio 5

# Diseñar una función que facilite la cuantificación de una secuencia
# Deberá permitir el ingreso como parámetro la cantidad de bits del codificador
# También que permita ingresar el rango de amplitud a codificar. VRef+ y VRef-


import numpy as np
import matplotlib.pyplot as plt

def cuantificar_senal(senal, bits, VRef_pos, VRef_neg):
    niveles = 2 ** bits
    paso = (VRef_pos - VRef_neg) / niveles

    senal_cuantificada = []
    for valor in senal:
        valor_clipped = max(min(valor, VRef_pos), VRef_neg)
        nivel = int((valor_clipped - VRef_neg) / paso)
        cuantificado = VRef_neg + nivel * paso
        senal_cuantificada.append(cuantificado)

    return senal_cuantificada

# Crear una señal analógica de ejemplo (onda senoidal)
t = np.linspace(0, 1, 500)
senal_analogica = 4 * np.sin(2 * np.pi * 5 * t) + 4

# Parámetros de cuantificación
bits_codificador = 3
VRef_pos = 8
VRef_neg = 0

# Cuantificar la señal
senal_cuantificada = cuantificar_senal(senal_analogica, bits_codificador, VRef_pos, VRef_neg)

# Graficar la señal original y la cuantificada
plt.figure(figsize=(10, 5))
plt.plot(t, senal_analogica, label='Señal Analógica', linewidth=2)
plt.step(t, senal_cuantificada, label='Señal Cuantificada', where='mid', linestyle='--', color='orange')
plt.title('Cuantificación de Señal Analógica')
plt.xlabel('Tiempo')
plt.ylabel('Amplitud')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()


