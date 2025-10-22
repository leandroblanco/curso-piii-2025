
# Proyecto: Generador de Tono Variable con dsPIC30F4013 y DAC R2R

Este proyecto utiliza un microcontrolador dsPIC30F4013 para generar una señal de frecuencia variable basada en la lectura de un voltaje analógico. La señal digital se convierte en analógica mediante un DAC R2R construido con resistencias.

## 🧩 Descripción General
- Se lee un voltaje entre 1V y 3V usando el ADC del dsPIC.
- Se genera una señal digital de 10 bits cuya frecuencia varía entre 50 Hz y 500 Hz.
- La señal se envía a través de 10 pines digitales conectados a un DAC R2R.
- La salida analógica se puede observar en un osciloscopio.

## ⚙️ Configuración del ADC
- Resolución: 12 bits (0 a 4095).
- Canal analógico: AN0.
- Modo: Conversión continua.
- Referencias: Vref+ y Vref-.

## 🔌 Configuración de Pines Digitales
- Se utilizan los pines RB0 a RB9 como salidas digitales.
- Estos pines se conectan al DAC R2R.

## 🎵 Generación de Señal de Frecuencia Variable
- La frecuencia se calcula en función del valor del ADC:
  ```
  frecuencia = 50 + ((adc_value * 450) / 4095)
  ```
- Se genera una onda cuadrada de 10 bits.

## 🧰 Diseño del DAC R2R
- DAC de 10 bits construido con resistencias en escalera.
- Valores típicos:
  - R = 10 kΩ
  - 2R = 20 kΩ
- La salida se conecta a un buffer (amplificador operacional) para observación.

![Diagrama DAC R2R](a2025e3c98.png)

## 🔬 Observación en Osciloscopio
- La salida del DAC R2R muestra una señal analógica cuya frecuencia varía según el voltaje aplicado.

## 🛠️ Compilación en MikroC
1. Abrir MikroC PRO for dsPIC.
2. Crear un nuevo proyecto para dsPIC30F4013.
3. Copiar el código fuente proporcionado.
4. Compilar y grabar el programa en el microcontrolador.

## 📁 Archivos Incluidos
- `main.c`: Código fuente en MikroC.
- `README.md`: Este archivo de documentación.
- `a2025e3c98.png`: Diagrama del DAC R2R.

