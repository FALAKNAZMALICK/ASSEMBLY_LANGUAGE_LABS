
.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'THE SUM FROM 1 TO 5 IS: ', '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    MOV CX, 10 ;      
    MOV AX, 0       

SUM_LOOP:
    ADD AX, CX      
    LOOP SUM_LOOP   

    MOV BL, 10      
    DIV BL          

    MOV BX, AX      

    MOV DL, BL
    ADD DL, 48      
    MOV AH, 02H     
    INT 21H

    MOV DL, BH
    ADD DL, 48      
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN