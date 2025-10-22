
void init_ports(void) {
    TRISB = 0xFF80; // RB0-RB6 como salidas, RB7-RB15 como entradas
    LATB = 0x00;    // Apagar todos los LEDs al inicio
}

void delay_ms(unsigned int ms) {
    while(ms--) {
        delay_ms(1);
    }
}

void main(void) {
    init_ports();

    while(1) {
        // Desplazamiento de izquierda a derecha
        for(uint8_t i = 0; i < 7; i++) {
            LATB = (1 << i);
            delay_ms(200);
        }

        // Desplazamiento de derecha a izquierda
        for(int8_t i = 5; i >= 0; i--) {
            LATB = (1 << i);
            delay_ms(200);
        }
    }
}