; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
#include <p18f4550.inc>

VARIAVEIS UDATA_ACS 0
;setar variável para o número de 8 bits
VAR RES 1
;setar variável para guardar a parte mais significativa
HI RES 1
;setar variável para guardar a parte menos significativa
LO RES 1
;setar variável para guardar o valor da soma das partes
SOMA RES 1
;setar um contador auxiliar
CONT RES 1

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

; TODO ADD INTERRUPTS HERE IF USED

MAIN_PROG CODE                      ; let linker place main program

START
    ;inicializar contador com em 4 e SOMA em 0
    MOVLW d'4'
    MOVWF CONT
    CLRF SOMA
    ;atribuir o valor de VAR e o mesmo colocar em HI e LO
    MOVLW b'11000110'
    MOVWF VAR
    MOVWF HI
    MOVWF LO
    ;separar a parte mais significativa
    MOVLW b'11110000'
    ANDWF HI
REPETE
    ;em cada repetição, rotacionar os bits de HI pra direita
    RRNCF HI
    ;verifica se CONT = 0 depois de decrementá-lo
    DECFSZ CONT
    ;Repete o Loop se contaux != 0
    GOTO REPETE
    ;separar a parte menos significativa
    MOVLW b'00001111'
    ANDWF LO
    ;somar as duas partes e guardar em SOMA
    CLRF W
    ADDLW HI
    ADDLW LO
    MOVWF SOMA
    END