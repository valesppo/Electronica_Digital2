;*** Directivas de Inclusión ***    
LIST P=16F887			
#include "p16f887.inc"	

;**** Definición de Variables ****
	    CBLOCK  0X20
		    DELAY1 
		    DELAY2 
		    DELAY3
	    ENDC
    
;*** Inicialización de Programa ***	    
	    ORG	    0x00
	    GOTO    INICIO
INICIO 	    ORG	    0x05
;*** Configuración de Puertos ***}
INICIO	    
LOOP	    CLRWDT
	    BSF	    STATUS,RP0
	    BSF	    STATUS,RP1	    ;Banco 3
	    CLRF    ANSEL
	    CLRF    ANSELH
	    BCF	    STATUS,RP1	    ;Banco 1
	    CLRF    TRISB
	    BCF	    STATUS,RP0	    ;Banco 0
	    CLRF    PORTB
	    BSF	    PORTB,RB0	    ;RB0 en 1
	    CALL    DELAY_1s
	    BCF	    PORTB,RB0	    ;RB0 en 0
	    BSF	    PORTB,RB1	    ;RB1 en 1
	    CLRWDT
	    CALL    DELAY_1s
	    BCF	    PORTB,RB1	    ;RB0 en 0
	    BSF	    PORTB,RB2	    ;RB1 en 1
	    CLRWDT
	    CALL    DELAY_1s
	    BCF	    PORTB,RB2	    ;RB0 en 0
	    BSF	    PORTB,RB3	    ;RB1 en 1
	    CLRWDT
	    CALL    DELAY_1s
	    BCF	    PORTB,RB3	    ;RB0 en 0
	    BSF	    PORTB,RB4	    ;RB1 en 1
	    CLRWDT
	    CALL    DELAY_1s
	    BCF	    PORTB,RB4	    ;RB0 en 0
	    BSF	    PORTB,RB5	    ;RB1 en 1
	    CLRWDT
	    CALL    DELAY_1s
	    BCF	    PORTB,RB5	    ;RB0 en 0
	    BSF	    PORTB,RB6	    ;RB1 en 1
	    CLRWDT
	    CALL    DELAY_1s
	    BCF	    PORTB,RB6	    ;RB0 en 0
	    BSF	    PORTB,RB7	    ;RB1 en 1
	    CLRWDT
	    CALL    DELAY_1s
	    BCF	    PORTB,RB7	    ;RB7 en 0
	    CLRWDT
	    GOTO    LOOP
	    
;*** Subrutinas ***	    
; Subrutina de Retardo con 3 Bucles Anidados para 1s 
DELAY_1s    MOVLW   D'255'	    ; 255 -> W
	    MOVWF   DELAY1	    ; W -> DELAY1
    LOOP1   MOVLW   D'245'	    ; 245 -> W
	    MOVWF   DELAY2	    ; W -> DELAY2
    LOOP2   MOVLW   D'4'	    ; 4 -> W
    	    MOVWF   DELAY3	    ; W -> DELAY3
    LOOP3   DECFSZ  DELAY3,F
	    GOTO    LOOP3
	    DECFSZ  DELAY2,F
	    GOTO    LOOP2
	    DECFSZ  DELAY1,F
	    GOTO    LOOP1
	    RETURN	
	    END	
