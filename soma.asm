Codigo Segment
Assume CS:Codigo; DS: Codigo; ES: Codigo; SS: Codigo
ORG 100H
ENTRADA: JMP INICIO
msg db 'entre com o numero:',0AH,0DH, '$'; mensagem com /n $ � usado para sinalizar o fim da string
line db 0AH,0DH,'$'; /n
result db 0AH,0DH,'seu resultado eh: ',0AH,0DH,'$'; segunda mensagem com /n	
INICIO PROC NEAR
    CALL PRINT; chama a fun��o print
    CALL LE_NUM ; chama a fun��o de ler o primeiro numero
    MOV BL, AL
    CALL SALTA_LINHA
    CALL PRINT
    CALL LE_NUM
    MOV CL, AL
    CALL RESULTADO
    ADD CL, BL
    MOV AH, 0
    MOV AL, CL
    AAA
    MOV CX, AX
    OR CX, 3030H
    MOV DL, CH
    CALL MOSTRA_NUM
    MOV DL, CL
    CALL MOSTRA_NUM
INT 20H
INICIO ENDP

LE_NUM PROC NEAR
    MOV AH,01H
    INT 21H
    RET
LE_NUM ENDP

SALTA_LINHA PROC NEAR
    MOV AH,09
    MOV DX, OFFSET line
    INT 21H
    RET
SALTA_LINHA ENDP

MOSTRA_NUM PROC NEAR
    MOV AH,02H
    INT 21H
    RET
MOSTRA_NUM ENDP

PRINT PROC NEAR
   MOV AH,09 
   MOV DX, OFFSET msg; imprime mensagem na tela
   INT 21H
   RET    
PRINT ENDP
RESULTADO PROC NEAR
   MOV AH,09
   MOV DX, OFFSET result
   INT 21H
   RET    
RESULTADO ENDP
Codigo ENDS
END ENTRADA
