![Diagrama de flujo 4D-PAM5](9df55d5aec.png)


# Comunicación 4D-PAM5 sobre TCP/IP

Este proyecto implementa un sistema de transmisión y recepción de mensajes utilizando **modulación PAM5** (Pulse Amplitude Modulation con 5 niveles) y **multiplexación por división de canales (4D)** sobre una red TCP/IP.

## Archivos

### `tx_pam5.py` – Transmisor

Este script realiza las siguientes funciones:

1. **Modulación PAM5**:
   - Convierte cada carácter del mensaje en un valor entre -2 y 2 usando `ord(c) % 5 - 2`.
   - Esto simula una codificación PAM5, donde cada símbolo representa uno de cinco niveles de amplitud.

2. **Multiplexación en 4 canales**:
   - El mensaje se divide en 4 submensajes (canales) intercalando los caracteres.
   - Esto permite simular una transmisión paralela de datos (4D).

3. **Empaquetado y envío**:
   - Cada canal modulado se convierte en una cadena de números separados por comas.
   - Los 4 canales se concatenan con `|` y se envían por un socket TCP al receptor.

> ⚠️ Requiere reemplazar `'IP_DEL_RECEPTOR'` por la IP real del receptor.

---

### `rx_pam5.py` – Receptor

Este script realiza las siguientes funciones:

1. **Recepción de datos**:
   - Escucha en el puerto 5000 por conexiones entrantes.
   - Recibe el paquete de datos enviado por el transmisor.

2. **Demodulación PAM5**:
   - Convierte los valores numéricos de -2 a 2 de vuelta a caracteres usando `(int(val) + 2) % 256`.
   - Esta operación es una forma simplificada de revertir la modulación.

3. **Reconstrucción del mensaje**:
   - Los 4 canales se intercalan para reconstruir el mensaje original.

---

## Teoría: ¿Qué es PAM5?

**PAM5 (Pulse Amplitude Modulation con 5 niveles)** es una técnica de modulación digital donde cada símbolo puede tomar uno de cinco niveles de amplitud distintos (por ejemplo: -2, -1, 0, 1, 2). Esto permite transmitir más bits por símbolo en comparación con PAM2 (binario).

En este proyecto, se usa una forma simplificada de PAM5 para codificar caracteres en niveles de amplitud, aunque no se realiza una conversión binaria real ni se considera ruido o sincronización como en un sistema físico.

---

## Ejecución

1. En el receptor:
   ```bash
   python rx_pam5.py
   ```

2. En el transmisor (en otra máquina o terminal):
   ```bash
   python tx_pam5.py
   ```

---

## Limitaciones

- La modulación y demodulación son simplificadas y no representan una implementación física real de PAM5.
- No hay control de errores ni sincronización.
- El sistema está diseñado para propósitos educativos y experimentales.
