# tx_pam5.py
import socket
import numpy as np

# PAM5 modulación: convierte caracteres en niveles -2 a 2
def pam5_modulate(data):
    return [(ord(c) % 5) - 2 for c in data]

# Divide el mensaje en 4 canales
def split_into_channels(message):
    return [message[i::4] for i in range(4)]

# Configuración del socket
HOST = 'IP_DEL_RECEPTOR'  # Reemplazar con la IP del RX
PORT = 5000

message = "Hola Leandro, esto es una prueba de 4D-PAM5"
channels = split_into_channels(message)
modulated_channels = [pam5_modulate(ch) for ch in channels]

# Empaquetar los datos como string
packet = '|'.join([','.join(map(str, ch)) for ch in modulated_channels])

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((HOST, PORT))
    s.sendall(packet.encode('utf-8'))
    print("Mensaje enviado.")