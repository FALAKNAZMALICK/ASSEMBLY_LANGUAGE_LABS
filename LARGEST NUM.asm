; find largest number 
.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter number 1: $'
    msg2 DB 0Ah, 0Dh, 'Enter number 2: $'
    msg3 DB 0Ah, 0Dh, 'Largest number is: $'
    ;NUM1 DB ?   
    ;NUM2 DB ?
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
    MOV BL, AL      ;MOV NUM1, AL     

    LEA DX, msg2
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, '0' 
    MOV BH, AL      ;MOV NUM2, AL      

    LEA DX, msg3
    MOV AH, 9
    INT 21H
    
    ;MOV BL, NUM1 
    ;MOV BL, NUM1
    CMP BL, BH           
    JAE FIRST_GREATER      ;JBE

    MOV DL, BH
    JMP PRINT_NOW

FIRST_GREATER:
    MOV DL, BL

PRINT_NOW:
    ADD DL, '0'          
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
