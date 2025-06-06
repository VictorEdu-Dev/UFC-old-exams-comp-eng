; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
#include <p18f4550.inc>
;Minha Matrícula: 472644
;Fórmula da constante: T = 100 + 100.N
;Então temos T = 100 + 100.4 -> T = 500 us
VARIAVEIS UDATA_ACS 0
 ;Contador para a rotina de atraso
 CONT RES 1
 

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

; TODO ADD INTERRUPTS HERE IF USED

MAIN_PROG CODE                      ; let linker place main program

START
    MOVLW b'11111000'
    MOVWF TRISD ;RD2, RD1 e RD0 como saída
    CLRF PORTD ;zera todos os bits do port D
REPETE ; Repete a cada 3.T de acordo com a Figura 1
    BCF PORTD, 0 ;limpa o bit 0 de PORTD
    BSF PORTD, 2 ;seta o bit 2 de PORTD
    CALL ATRASO ;Chama a rotina de atraso que deve ter 500 us de duração
    BCF PORTD, 2 ;Limpa o bit 2 de PORTD
    BSF PORTD, 1 ;Seta o bit 1 de PORTD
    CALL ATRASO ;Chama o segundo atraso
    BCF PORTD, 1 ;Limpa o bit 1 de PORTD
    BSF PORTD, 0 ;Seta o bit 0  de PORTD
    CALL ATRASO ; 2 us - Chama o último atraso
    GOTO REPETE ; Repete indefinidamente as etapas
 
;Rotina de atraso
ATRASO
    ;setar o contador do loop
    MOVLW .98 ;1 us
    MOVWF CONT ;1 us
    NOP
    NOP
    NOP
    NOP
LOOP
    NOP ;1 us
    NOP ;1 us
    DECFSZ CONT ;1 us
    GOTO LOOP ;2 us
    RETURN ;2 us
    GOTO $                          ; loop forever

    END