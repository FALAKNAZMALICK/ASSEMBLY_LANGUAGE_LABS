;PRINT TABLE OF 2
.MODEL SMALL
.STACK 100H
.DATA
    MSG DB '2 * $'        ;
    EQ  DB ' = $'
    NL  DB 13, 10, '$'
    VAL DB 1          
    RES    DB ?          

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

LOOP_2:
    CMP VAL, 11
    JE EXIT

    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    MOV AH, 0
    MOV AL, VAL
    MOV BL, 10
    DIV BL               
    MOV BX, AX           

    CMP BL, 0
    JE PRINT_TABL
    MOV DL, BL
    ADD DL, 48
    MOV AH, 02H
    INT 21H

PRINT_TABL:
    MOV DL, BH
    ADD DL, 48
    MOV AH, 02H
    INT 21H

    MOV AH, 09H
    LEA DX, EQ
    INT 21H

    MOV AL, VAL
    MOV BL, 2          ;
    MUL BL
    MOV RES, AL

    MOV AH, 0
    MOV AL, RES
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

    MOV AH, 09H
    LEA DX, NL
    INT 21H

    INC VAL
    JMP LOOP_2

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN


