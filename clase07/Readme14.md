
# Tonos de Shepard – Análisis de `ejercicio14clase07.py` y teoría

> **Estado del documento**: Este README fue generado a partir del archivo **`ejercicio14clase07.py`** que compartiste. Incluye un **análisis técnico detallado**, mejoras propuestas y una **explicación completa** de la teoría de Tonos de Shepard.

---

## 1) Análisis del código: `ejercicio14clase07.py`

### 1.1 Resumen funcional
El script genera **tonos y escalas de Shepard** (ascendente y descendente), reproduce el audio en entorno Jupyter, y visualiza **señal en el tiempo**, **espectro por FFT** y **espectrograma**. Los parámetros por defecto son: `base_freq=440 Hz`, `num_tones=8`, `duration=0.5 s` por paso, `sample_rate=44100 Hz`, `steps=100` (una octava en 100 pasos).  citeturn4search1

### 1.2 Estructura
- **Funciones**:
  - `generate_shepard_tone(base_freq, num_tones, duration, sample_rate)`: suma `num_tones` senoidales separados por octavas (`freq = base * 2**i`) con una envolvente **por índice** `amplitude = sin(pi*i/num_tones)^2`.  citeturn4search1
  - `generate_shepard_scale(base_freq, num_tones, duration, sample_rate, steps)`: concatena `steps` tonos ascendentes con `base * 2**(step/steps)` (una octava).  citeturn4search1
  - `generate_shepard_scale_descending(...)`: versión descendente mediante `2**((steps-1-step)/steps)`.  citeturn4search1
- **Gráficos**: señal (zoom), FFT de magnitud sin ventana, y espectrograma (`scipy.signal.spectrogram`).  citeturn4search1

### 1.3 Correctitud psicoacústica y DSP
1) **Envolvente espectral**: En la literatura de Shepard/Risset la envolvente suele ser **gaussiana en log-frecuencia** `A(f)`, centrada en una banda perceptiva, para que al “subir” una componente se atenúe arriba **y reaparezca abajo**, manteniendo la ilusión de subida infinita. Tu código usa `sin^2` **en el índice `i`** (no en frecuencia), lo cual no asegura el *re-entrada* suave de bajas frecuencias ni un centrado perceptivo estable.  citeturn4search1

2) **Aliasing**: Con `base=440` y `num_tones=8`, la componente más alta es `440 * 2**7 = 56,320 Hz > 22,050 Hz (Nyquist)`, por lo que habrá aliasing. La envolvente `sin^2` atenúa pero **no elimina** las componentes fuera de banda. Es recomendable **limitar** a `f < sample_rate/2` o calcular dinámicamente el rango de octavas admisible.  citeturn4search1

3) **Continuidad temporal**: Cada paso de la escala concatena bloques con **fase reiniciada**, lo que puede generar **clicks** o discontinuidades entre segmentos (no hay *crossfade* ni continuidad de fase).  citeturn4search1

4) **Normalización y clipping**: La suma de senoidales puede sobrepasar ±1. No hay normalización previa a reproducir/guardar.  citeturn4search1

5) **FFT de una señal no estacionaria**: Se calcula FFT de **toda la escala** (50 s). Dado que el contenido varía en el tiempo, una FFT global no es representativa; el espectrograma sí lo es. Además no se aplica **ventana** (fuga espectral).  citeturn4search1

6) **Detalles menores**: En el gráfico descendente, el título dice "Zoom a 0–1 ms" pero `xlim` fija **0–5 ms** (`0.005`).  citeturn4search1

### 1.4 Complejidad y rendimiento
- Generación de escala: `steps` bloques de `duration*sample_rate` muestras ⇒ **O(N)** con `N = steps*duration*fs` (en tu caso ≈ 2.205e6 muestras).  citeturn4search1
- Espectrograma: coste adicional por STFT en toda la señal. Con 44.1 kHz y 50 s puede ser pesado, pero manejable en Colab/PC actual.  citeturn4search1

### 1.5 Mejores prácticas y mejoras sugeridas
1) **Envolvente gaussiana en log-frecuencia**
   Define `A(f) = exp(- (log2(f/fc))^2 / (2*sigma^2))` con `fc` (p. ej. 700–1000 Hz) y `sigma` (0.4–0.6 oct.). Esto produce el clásico perfil Shepard y permite **re-entrada suave**.  
2) **Anti-aliasing**
   Incluí únicamente componentes con `f < fs/2` y opcionalmente `f > f_min` para evitar infra‑sonidos.
3) **Continuidad entre pasos**
   Agregá **fades** de 5–20 ms (raised‑cosine) o generá la señal **continuamente** (Shepard–Risset) sin reiniciar fases.
4) **Normalización**
   Normalizá el audio final a `-1..1` o a un **RMS objetivo**.
5) **Espectro**
   Para analizar un paso concreto, usá **ventana Hann** y magnitud en **dB**. Para vista global, mantené el **espectrograma** (agregá `+1e-12` al `log10`).
6) **Portabilidad**
   `IPython.display.Audio` sólo funciona en notebooks. Para scripts `.py`, usá `scipy.io.wavfile.write` o `soundfile.write`.

### 1.6 Snippets propuestos

**A) Generador de tono Shepard con envolvente gaussiana + anti‑aliasing**
```python
import numpy as np

def shepard_tone_gauss(base_freq, duration, fs, fc=800.0, sigma=0.5, K=5, rng=None):
    """Un único bloque (paso) de un tono de Shepard con envolvente gaussiana.
    base_freq: frecuencia base del paso (Hz)
    fc: centro de la envolvente (Hz); sigma: ancho en octavas; K: nº de octavas por lado
    """
    t = np.arange(int(duration*fs)) / fs
    y = np.zeros_like(t)
    if rng is None:
        rng = np.random.default_rng(0)
    phases = rng.uniform(0, 2*np.pi, 2*K+1)

    def A(f):
        return np.exp(- (np.log2(f / fc) ** 2) / (2 * sigma ** 2))

    for i, k in enumerate(range(-K, K+1)):
        f = base_freq * (2 ** k)
        if f <= 0 or f >= fs/2:
            continue
        y += A(f) * np.sin(2*np.pi*f*t + phases[i])

    # normalizar paso (opcional)
    peak = np.max(np.abs(y)) + 1e-12
    return y / peak
```

**B) Escala discreta con crossfade (sin clicks)**
```python
def shepard_scale_discrete(base_freq, steps, step_dur, fs, **tone_kwargs):
    fade = int(0.02 * fs)  # 20 ms
    out = []
    rng = np.random.default_rng(42)
    for n in range(steps):
        f0 = base_freq * (2 ** (n/steps))  # una octava
        y = shepard_tone_gauss(f0, step_dur, fs, rng=rng, **tone_kwargs)
        # aplicar ventana de entrada/salida (raised-cosine)
        w = np.ones_like(y)
        if fade > 0 and fade*2 < y.size:
            ramp = 0.5 - 0.5*np.cos(np.linspace(0, np.pi, fade))
            w[:fade] *= ramp
            w[-fade:] *= ramp[::-1]
        out.append(y*w)
    x = np.concatenate(out)
    return x / (np.max(np.abs(x)) + 1e-12)
```

**C) FFT con ventana Hann y magnitud en dB**
```python
from numpy.fft import rfft, rfftfreq

def mag_spectrum_db(x, fs):
    w = np.hanning(x.size)
    X = rfft(x * w)
    f = rfftfreq(x.size, 1/fs)
    mag_db = 20*np.log10(np.maximum(np.abs(X), 1e-12))
    return f, mag_db
```

**D) Guardado a WAV (para usar fuera de Jupyter)**
```python
from scipy.io import wavfile

wavfile.write('shepard_scale.wav', sample_rate, (shepard_scale*0.9).astype(np.float32))
```

### 1.7 Observaciones de los gráficos actuales
- **Señal (zoom 0–5 ms)**: formas sinusoidales superpuestas; los cortes entre pasos pueden producir pequeñas discontinuidades al no preservar fase/ni aplicar fades.  citeturn4search1
- **FFT global**: mezcla todo el barrido (no estacionario); útil sólo a modo ilustrativo. Mejor evaluar por paso o quedarse con el **espectrograma**.  citeturn4search1
- **Espectrograma**: muestra bandas horizontales separadas por octavas que “suben” o “bajan”; añadir un piso para evitar `log10(0)`: `10*np.log10(Sxx + 1e-12)`.  citeturn4search1

### 1.8 Detalles a corregir (rápidos)
- En el gráfico de escala descendente, ajustar el título a “**Zoom a 0–5 ms**” o cambiar `xlim(0, 0.001)` si querés 1 ms real.  citeturn4search1

---

## 2) Teoría de los Tonos de Shepard (resumen práctico)

Los **Tonos de Shepard** son una ilusión auditiva en la que una secuencia parece **ascender (o descender) infinitamente** en altura. Se logra sumando varias **senoidales separadas por octavas** y aplicando una **envolvente espectral** (típicamente **gaussiana en log‑frecuencia**) que enfatiza una banda central (p. ej., ~700–1000 Hz) y atenúa extremos. Al desplazar la base una octava, las componentes que “salen por arriba” se desvanecen y **reaparecen por abajo**, manteniendo una **circularidad de pitch**.

### 2.1 Modelo matemático
Para un paso (o instante) con base `f0`:
\[
 x(t) = \sum_{k=-K}^{K} A(2^k f_0)\; \sinig(2\pi\, 2^k f_0\, t + \phi_kig),
\]
con `A(f)` gaussiana en log‑frecuencia y `\phi_k` fases (aleatorias o fijas). Para un **glissando continuo** (Risset), `f0(t) = f_{0,ini} \cdot 2^{r t}` (r octavas/seg), manteniendo `A(·)` centrada.

