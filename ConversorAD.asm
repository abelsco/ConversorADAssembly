;* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
;*                        (CODIGO 3)                               *
;*                          UTFPR                                  *
;*         DESENVOLVIDO ABEL MENEZES                               *
;*   VERSAO: 1.0                           DATA: 10/04/2018        *
;* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
;*             BOTAO INCREMENTO DECREMENTO COM INTERRUPCAO         *
;*                                                                 *
;* INCREMENTA OU DECREMENTA UM DISPLAY DE 7 SEGMENTOS COM BASE EM  *
;* 2 BOTOES                                                        *
;*                                                                 *
;*                                                                 *
;*-----------------------------------------------------------------*
;* CODIGO PARA 8051 DA DISCIPLINA "SISTEMAS MICROCONTROLADOS".     *
;*                                                                 *
;*                                                                 *
;* INPUT: P3.2 E P3.3                                              *
;* OUTPUT: DISPLAY DE 7 SEGMENTOS E LED PARA PONTO EM P0           *
;*                                                                 *
;* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

        CS EQU P3.7
        RD EQU P3.6
        WR EQU P3.5

        ORG 0000h
        MOV P1,#11111111b
        AJMP SETUP

        ORG 000Bh
        AJMP TRATA_INTERRUP

SETUP: 
        MOV P0, #00000000b
        MOV R7, #250d
        MOV IE, #10000010b
        MOV IP, #00000000b
        MOV TMOD, #00000010b
        MOV TCON, #00010000b
        MOV TH0, #0d
        MOV TL0, #0d

        CLR CS
        CLR RD
        CLR WR
        SETB WR

        JMP MAIN

MAIN:
        NOP
        JMP MAIN

TRATA_INTERRUP:
        DJNZ R7, VOLTA
        MOV R7, #250d
        MOV A,P1
        MOV P0,A
        SETB CS
        NOP
        NOP
        CLR CS
        CLR RD
        CLR WR
        SETB WR
VOLTA:
        RETI
  
        END
