#line 1 "C:/Cosas/P III/Codigos/curso-piii-2025/DSPIC/hola_mundo.c"
void detectarIntT2() org 0x0020 {
 IFS0bits.T2IF = 0;

 ADCON1bits.DONE = 0;
 ADCON1bits.SAMP = 1;

 asm nop;

 ADCON1bits.SAMP = 0;

}

void config_puertos() {

 TRISBbits.TRISB0 = 0;

 TRISBbits.TRISB2 = 1;
 TRISBbits.TRISB3 = 0;
 TRISBbits.TRISB4 = 0;
 TRISBbits.TRISB5 = 0;
 TRISBbits.TRISB6 = 0;
 TRISBbits.TRISB7 = 0;
 TRISBbits.TRISB8 = 0;
 TRISBbits.TRISB9 = 0;
 TRISBbits.TRISB10 = 0;
}



void config_timer2() {

 T2CON = 0x0000;

 PR2 = 39062;

 T2CONbits.TCKPS = 0b10;
 T2CONbits.TON = 1;


 IEC0bits.T2IE = 1;
}



void config_adc() {
 ADPCFG = 0xFFFB;


 ADCON1bits.ADON = 0;
 ADCON1bits.ADSIDL = 1;
 ADCON1bits.FORM = 0b00;

 ADCON1bits.SSRC = 0b000;

 ADCON1bits.ASAM = 0;

 ADCON2bits.VCFG = 0b000;
 ADCON2bits.SMPI = 0b0000;





 ADCHS = 0b0010;

 ADCON1bits.ADON = 1;
}

void interrupcionADC() org 0x002A {
 unsigned int valorADC = ADCBUF0;
 char txt[6];
 int nivel = valorADC / 512;
 LATBbits.LATB0 = !LATBbits.LATB0;


 LATBbits.LATB3 = 0;
 LATBbits.LATB4 = 0;
 LATBbits.LATB5 = 0;
 LATBbits.LATB6 = 0;
 LATBbits.LATB7 = 0;
 LATBbits.LATB8 = 0;
 LATBbits.LATB9 = 0;
 LATBbits.LATB10 = 0;


 if (nivel >= 1) LATBbits.LATB3 = 1;
 if (nivel >= 2) LATBbits.LATB4 = 1;
 if (nivel >= 3) LATBbits.LATB5 = 1;
 if (nivel >= 4) LATBbits.LATB6 = 1;
 if (nivel >= 5) LATBbits.LATB7 = 1;
 if (nivel >= 6) LATBbits.LATB8 = 1;
 if (nivel >= 7) LATBbits.LATB9 = 1;
 if (nivel >= 8) LATBbits.LATB10 = 1;

 IFS0bits.ADIF = 0;




 UART1_Write(nivel);


}


int main() {


 UART1_Init(9600);
 Delay_ms(100);

 config_puertos();
 config_timer2();


 config_adc();

 IEC0bits.ADIE = 1;

 while (1) {

 }

 return 0;
}
