# Análisis del Código: multiples_graficos_de_ejercicio12clase06.py

Este script implementa y visualiza diferentes tipos de modulación de amplitud (AM), incluyendo:
- AM-DSB-FC (Doble Banda Lateral con Portadora Completa)
- AM-DSB-SC (Doble Banda Lateral con Portadora Suprimida)
- SSB-SC (Banda Lateral Única con Portadora Suprimida)
- SSB-FC (Banda Lateral Única con Portadora Completa)

## Objetivo

Comparar visualmente y espectralmente las distintas técnicas de modulación AM utilizando una señal de mensaje senoidal de 200 Hz y una portadora de 5 kHz.

## Descripción del Código

### 1. Parámetros Iniciales
- `fs = 441000`: Frecuencia de muestreo.
- `t`: Vector de tiempo para 10 ms.
- `fm = 200`, `Am = 0.7`: Frecuencia y amplitud de la señal de mensaje.
- `fc = 5000`, `Ac = 1.0`: Frecuencia y amplitud de la portadora.

### 2. Generación de Señales
- `m_t`: Señal de mensaje senoidal.
- `c_t`: Señal portadora senoidal.

### 3. Tipos de Modulación

#### AM-DSB-FC (Doble Banda Lateral con Portadora Completa)
- Fórmula: `y_dsb_fc_t = (1 + m_t) * c_t`
- Incluye la portadora y ambas bandas laterales.

#### AM-DSB-SC (Doble Banda Lateral con Portadora Suprimida)
- Fórmula: `y_dsb_sc_t = m_t * c_t`
- Suprime la portadora, dejando solo las bandas laterales.

#### SSB-SC (Banda Lateral Única con Portadora Suprimida)
- Utiliza la señal analítica de `m_t` mediante la transformada de Hilbert.
- Fórmula: `y_ssb_sc_t = 0.5 * (m_t * cos(fc*t) - imag(hilbert(m_t)) * sin(fc*t))`
- Transmite solo una banda lateral (superior).

#### SSB-FC (Banda Lateral Única con Portadora Completa)
- Fórmula: `y_ssb_fc_t = Ac * cos(fc*t) + SSB-SC`
- Incluye la portadora junto con una sola banda lateral.

### 4. Visualización en el Tiempo
- Se grafican:
  - Señal de mensaje
  - Señal portadora (zoom)
  - Señales moduladas: AM-DSB-FC, AM-DSB-SC, SSB-SC

### 5. Visualización en Frecuencia
- Se calcula la FFT de cada señal modulada.
- Se grafican los espectros hasta 8 kHz para comparar las bandas laterales y la presencia/ausencia de portadora.

### 6. Experimentación
- Se puede modificar `Am` para observar el efecto de la sobremodulación (`Am > 1`).
- En sobremodulación, la envolvente se distorsiona y puede dificultar la demodulación.

## Conclusión

Este código permite estudiar y comparar las principales variantes de modulación AM, tanto en el dominio del tiempo como en el de la frecuencia. Es útil para entender cómo se comportan las señales moduladas y cómo se distribuyen sus componentes espectrales.
