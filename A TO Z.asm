;PRINT A TO Z
.MODEL SMALL
.STACK 100H
.DATA
    SPACE DB ' $'        
    CHAR  DB 97             ;      65 , 97

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

PRINT_LOOP:
    CMP CHAR, 123            ;      91 , 123
    JE EXIT

    MOV DL, CHAR
    MOV AH, 02H
    INT 21H

    MOV AH, 09H
    LEA DX, SPACE
    INT 21H

    INC CHAR
    JMP PRINT_LOOP

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN


