;PRINT 2
.MODEL SMALL
.STACK 100H
.DATA
    SPACE DB ' $'        
    NUM   DB 2              ;

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

PRINT_LOOP:
    CMP NUM, 22       ;  
    JE EXIT

    MOV AH, 0
    MOV AL, NUM
    MOV BL, 10
    DIV BL               
    MOV BX, AX           

    CMP BL, 0
    JE PRINT_ONES
    MOV DL, BL
    ADD DL, 48          
    MOV AH, 02H
    INT 21H

PRINT_ONES:
    MOV DL, BH
    ADD DL, 48           
    MOV AH, 02H
    INT 21H

    MOV AH, 09H
    LEA DX, SPACE
    INT 21H

    ADD NUM, 2      ;
    JMP PRINT_LOOP

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN



