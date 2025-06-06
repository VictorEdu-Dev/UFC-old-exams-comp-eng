; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
#include <p18f4550.inc>

VARIAVEIS UDATA_ACS 0
;criar duas variáveis de 1 byte para armazenar os dois números de 2 bytes e sua soma
A1 RES 1
A0 RES 1
B1 RES 1
B0 RES 1
SOMA1 RES 1
SOMA0 RES 1
 
 
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

; TODO ADD INTERRUPTS HERE IF USED

MAIN_PROG CODE                      ; let linker place main program

START
    ;0 - Parte mais significativa de A
    MOVLW 0x1C
    MOVWF A1
    ;1 - Parte menos significativa de A
    MOVLW 0xD1
    MOVWF A0
    ;2 - Parte mais significativa de B
    MOVLW 0x48
    MOVWF B1
    ;3 - Parte menos significativa de B
    MOVLW 0xC1
    MOVWF B0
    ; soma - começa pelo menos significativo
    ;(1) + (3) -> (5)
    MOVF A0, W;Move (1) para o W
    ADDWF B0, W;Somou W(1) com (3) - 
    ;O status foi modificado - Gerou carry
    MOVWF SOMA0;Enviou o resultado para (5)
    ; A parte mais significativa
    MOVF A1, W
    ADDWFC B1, W
    MOVWF SOMA1; A parte mais significativa do resultado
    END