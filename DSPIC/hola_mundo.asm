
_detectarIntT2:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;hola_mundo.c,1 :: 		void detectarIntT2() org 0x0020  {
;hola_mundo.c,2 :: 		IFS0bits.T2IF = 0;  // Borrar bandera de interrupción T2
	BCLR.B	IFS0bits, #6
;hola_mundo.c,4 :: 		ADCON1bits.DONE = 0;  // Antes de pedir una muestra ponemos en cero
	BCLR.B	ADCON1bits, #0
;hola_mundo.c,5 :: 		ADCON1bits.SAMP = 1;  // Pedimos una muestra
	BSET.B	ADCON1bits, #1
;hola_mundo.c,7 :: 		asm nop;
	NOP
;hola_mundo.c,9 :: 		ADCON1bits.SAMP = 0;  // Pedimos que retenga la muestra
	BCLR.B	ADCON1bits, #1
;hola_mundo.c,11 :: 		}
L_end_detectarIntT2:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _detectarIntT2

_config_puertos:

;hola_mundo.c,13 :: 		void config_puertos()  {
;hola_mundo.c,15 :: 		TRISBbits.TRISB0 = 0;
	BCLR.B	TRISBbits, #0
;hola_mundo.c,17 :: 		TRISBbits.TRISB2 = 1;
	BSET.B	TRISBbits, #2
;hola_mundo.c,18 :: 		TRISBbits.TRISB3 = 0;
	BCLR.B	TRISBbits, #3
;hola_mundo.c,19 :: 		TRISBbits.TRISB4 = 0;
	BCLR.B	TRISBbits, #4
;hola_mundo.c,20 :: 		TRISBbits.TRISB5 = 0;
	BCLR.B	TRISBbits, #5
;hola_mundo.c,21 :: 		TRISBbits.TRISB6 = 0;
	BCLR.B	TRISBbits, #6
;hola_mundo.c,22 :: 		TRISBbits.TRISB7 = 0;
	BCLR.B	TRISBbits, #7
;hola_mundo.c,23 :: 		TRISBbits.TRISB8 = 0;
	BCLR	TRISBbits, #8
;hola_mundo.c,24 :: 		TRISBbits.TRISB9 = 0;
	BCLR	TRISBbits, #9
;hola_mundo.c,25 :: 		TRISBbits.TRISB10 = 0;
	BCLR	TRISBbits, #10
;hola_mundo.c,26 :: 		}
L_end_config_puertos:
	RETURN
; end of _config_puertos

_config_timer2:

;hola_mundo.c,30 :: 		void config_timer2()  {
;hola_mundo.c,32 :: 		T2CON = 0x0000;     // Timer apagado, configuración por defecto
	CLR	T2CON
;hola_mundo.c,34 :: 		PR2 = 39062;         // Periodo del timer volver 2500
	MOV	#39062, W0
	MOV	WREG, PR2
;hola_mundo.c,36 :: 		T2CONbits.TCKPS = 0b10;  // Prescaler 1:1 (0b00)   actual 1:64
	MOV.B	#32, W0
	MOV.B	W0, W1
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W1, [W0], W1
	MOV.B	#48, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(T2CONbits), W0
	XOR.B	W1, [W0], W1
	MOV	#lo_addr(T2CONbits), W0
	MOV.B	W1, [W0]
;hola_mundo.c,37 :: 		T2CONbits.TON = 1;       // Encender Timer2
	BSET	T2CONbits, #15
;hola_mundo.c,40 :: 		IEC0bits.T2IE = 1;       // Habilitar interrupción de Timer2
	BSET.B	IEC0bits, #6
;hola_mundo.c,41 :: 		}
L_end_config_timer2:
	RETURN
; end of _config_timer2

_config_adc:

;hola_mundo.c,45 :: 		void config_adc()  {
;hola_mundo.c,46 :: 		ADPCFG = 0xFFFB; // Elije la entrada analógica a convertir en este caso AN2.
	MOV	#65531, W0
	MOV	WREG, ADPCFG
;hola_mundo.c,49 :: 		ADCON1bits.ADON = 0;  // ADC Apagado por ahora
	BCLR	ADCON1bits, #15
;hola_mundo.c,50 :: 		ADCON1bits.ADSIDL = 1;  // No trabaja en modo idle
	BSET	ADCON1bits, #13
;hola_mundo.c,51 :: 		ADCON1bits.FORM = 0b00;  // Formato de salida entero
	MOV	ADCON1bits, W1
	MOV	#64767, W0
	AND	W1, W0, W0
	MOV	WREG, ADCON1bits
;hola_mundo.c,53 :: 		ADCON1bits.SSRC = 0b000;
	MOV	#lo_addr(ADCON1bits), W0
	MOV.B	[W0], W1
	MOV.B	#31, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(ADCON1bits), W0
	MOV.B	W1, [W0]
;hola_mundo.c,55 :: 		ADCON1bits.ASAM = 0;
	BCLR.B	ADCON1bits, #2
;hola_mundo.c,57 :: 		ADCON2bits.VCFG = 0b000;  // Referencia con AVdd y AVss
	MOV	ADCON2bits, W1
	MOV	#8191, W0
	AND	W1, W0, W0
	MOV	WREG, ADCON2bits
;hola_mundo.c,58 :: 		ADCON2bits.SMPI = 0b0000;  // Lanza interrupción luego de tomar n muestras.
	MOV	#lo_addr(ADCON2bits), W0
	MOV.B	[W0], W1
	MOV.B	#195, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(ADCON2bits), W0
	MOV.B	W1, [W0]
;hola_mundo.c,64 :: 		ADCHS = 0b0010;
	MOV	#2, W0
	MOV	WREG, ADCHS
;hola_mundo.c,66 :: 		ADCON1bits.ADON = 1;// Habilitamos el A/D
	BSET	ADCON1bits, #15
;hola_mundo.c,67 :: 		}
L_end_config_adc:
	RETURN
; end of _config_adc

_interrupcionADC:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;hola_mundo.c,69 :: 		void interrupcionADC() org 0x002A {
;hola_mundo.c,70 :: 		unsigned int valorADC = ADCBUF0;
	PUSH	W10
; valorADC start address is: 2 (W1)
	MOV	ADCBUF0, W1
;hola_mundo.c,72 :: 		int nivel = valorADC / 512; // 4096 / 512 = 128 por nivel
	LSR	W1, #9, W0
; valorADC end address is: 2 (W1)
; nivel start address is: 2 (W1)
	MOV	W0, W1
;hola_mundo.c,73 :: 		LATBbits.LATB0 = !LATBbits.LATB0;
	BTG	LATBbits, #0
;hola_mundo.c,76 :: 		LATBbits.LATB3 = 0;
	BCLR.B	LATBbits, #3
;hola_mundo.c,77 :: 		LATBbits.LATB4 = 0;
	BCLR.B	LATBbits, #4
;hola_mundo.c,78 :: 		LATBbits.LATB5 = 0;
	BCLR.B	LATBbits, #5
;hola_mundo.c,79 :: 		LATBbits.LATB6 = 0;
	BCLR.B	LATBbits, #6
;hola_mundo.c,80 :: 		LATBbits.LATB7 = 0;
	BCLR.B	LATBbits, #7
;hola_mundo.c,81 :: 		LATBbits.LATB8 = 0;
	BCLR	LATBbits, #8
;hola_mundo.c,82 :: 		LATBbits.LATB9 = 0;
	BCLR	LATBbits, #9
;hola_mundo.c,83 :: 		LATBbits.LATB10 = 0;
	BCLR	LATBbits, #10
;hola_mundo.c,86 :: 		if (nivel >= 1) LATBbits.LATB3 = 1;
	CP	W0, #1
	BRA GE	L__interrupcionADC17
	GOTO	L_interrupcionADC0
L__interrupcionADC17:
	BSET.B	LATBbits, #3
L_interrupcionADC0:
;hola_mundo.c,87 :: 		if (nivel >= 2) LATBbits.LATB4 = 1;
	CP	W1, #2
	BRA GE	L__interrupcionADC18
	GOTO	L_interrupcionADC1
L__interrupcionADC18:
	BSET.B	LATBbits, #4
L_interrupcionADC1:
;hola_mundo.c,88 :: 		if (nivel >= 3) LATBbits.LATB5 = 1;
	CP	W1, #3
	BRA GE	L__interrupcionADC19
	GOTO	L_interrupcionADC2
L__interrupcionADC19:
	BSET.B	LATBbits, #5
L_interrupcionADC2:
;hola_mundo.c,89 :: 		if (nivel >= 4) LATBbits.LATB6 = 1;
	CP	W1, #4
	BRA GE	L__interrupcionADC20
	GOTO	L_interrupcionADC3
L__interrupcionADC20:
	BSET.B	LATBbits, #6
L_interrupcionADC3:
;hola_mundo.c,90 :: 		if (nivel >= 5) LATBbits.LATB7 = 1;
	CP	W1, #5
	BRA GE	L__interrupcionADC21
	GOTO	L_interrupcionADC4
L__interrupcionADC21:
	BSET.B	LATBbits, #7
L_interrupcionADC4:
;hola_mundo.c,91 :: 		if (nivel >= 6) LATBbits.LATB8 = 1;
	CP	W1, #6
	BRA GE	L__interrupcionADC22
	GOTO	L_interrupcionADC5
L__interrupcionADC22:
	BSET	LATBbits, #8
L_interrupcionADC5:
;hola_mundo.c,92 :: 		if (nivel >= 7) LATBbits.LATB9 = 1;
	CP	W1, #7
	BRA GE	L__interrupcionADC23
	GOTO	L_interrupcionADC6
L__interrupcionADC23:
	BSET	LATBbits, #9
L_interrupcionADC6:
;hola_mundo.c,93 :: 		if (nivel >= 8) LATBbits.LATB10 = 1;
	CP	W1, #8
	BRA GE	L__interrupcionADC24
	GOTO	L_interrupcionADC7
L__interrupcionADC24:
	BSET	LATBbits, #10
L_interrupcionADC7:
;hola_mundo.c,95 :: 		IFS0bits.ADIF = 0; // Borrar bandera de interrupción ADC
	BCLR	IFS0bits, #11
;hola_mundo.c,100 :: 		UART1_Write(nivel);
	MOV	W1, W10
; nivel end address is: 2 (W1)
	CALL	_UART1_Write
;hola_mundo.c,103 :: 		}
L_end_interrupcionADC:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _interrupcionADC

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;hola_mundo.c,106 :: 		int main() {
;hola_mundo.c,109 :: 		UART1_Init(9600);            // usa clock del proyecto
	PUSH	W10
	PUSH	W11
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;hola_mundo.c,110 :: 		Delay_ms(100);               // breve estabilización
	MOV	#2, W8
	MOV	#17796, W7
L_main8:
	DEC	W7
	BRA NZ	L_main8
	DEC	W8
	BRA NZ	L_main8
	NOP
	NOP
;hola_mundo.c,112 :: 		config_puertos();
	CALL	_config_puertos
;hola_mundo.c,113 :: 		config_timer2();
	CALL	_config_timer2
;hola_mundo.c,116 :: 		config_adc();
	CALL	_config_adc
;hola_mundo.c,118 :: 		IEC0bits.ADIE = 1;  // Habilitamos interrupción del A/D
	BSET	IEC0bits, #11
;hola_mundo.c,120 :: 		while (1) {
L_main10:
;hola_mundo.c,122 :: 		}
	GOTO	L_main10
;hola_mundo.c,125 :: 		}
L_end_main:
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
