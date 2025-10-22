# rx_pam5.py
import socket

# PAM5 demodulación: convierte niveles -2 a 2 en caracteres aproximados
def pam5_demodulate(data):
    return ''.join([chr((int(val) + 2) % 256) for val in data])

# Reconstruye el mensaje original desde los 4 canales
def reconstruct_message(channels):
    max_len = max(len(ch) for ch in channels)
    message = ''
    for i in range(max_len):
        for ch in channels:
            if i < len(ch):
                message += ch[i]
    return message

HOST = '0.0.0.0'
PORT = 5000

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    print("Esperando conexión...")
    conn, addr = s.accept()
    with conn:
        print(f"Conectado por {addr}")
        data = conn.recv(4096).decode('utf-8')
        raw_channels = data.split('|')
        channels = [pam5_demodulate(ch.split(',')) for ch in raw_channels]
        message = reconstruct_message(channels)
        print("Mensaje recibido y reconstruido:")
        print(message)