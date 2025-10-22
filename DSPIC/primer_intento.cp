#line 1 "C:/Cosas/P III/Codigos/curso-piii-2025/DSPIC/primer_intento.c"

void init_ports(void) {
 TRISB = 0xFF80;
 LATB = 0x00;
}

void delay_ms(unsigned int ms) {
 while(ms--) {
 delay_ms(1);
 }
}

void main(void) {
 init_ports();

 while(1) {

 for(uint8_t i = 0; i < 7; i++) {
 LATB = (1 << i);
 delay_ms(200);
 }


 for(int8_t i = 5; i >= 0; i--) {
 LATB = (1 << i);
 delay_ms(200);
 }
 }
}
