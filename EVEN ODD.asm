; find number input by user is EVEN or ODD 
.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter number: $'
    msg2 DB 0Ah, 0Dh, 'EVEN$'
    msg3 DB 0Ah, 0Dh, 'ODD$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, msg1
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, '0'          

    SHR AL, 1            

    JC IS_ODD            

    LEA DX, msg2
    MOV AH, 9
    INT 21H
    JMP EXIT             

IS_ODD:
    LEA DX, msg3
    MOV AH, 9
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

