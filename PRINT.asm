.MODEL SMALL
.STACK 100h
.DATA
    n1 DB 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV DL, '1'
    MOV CX, 9
PRINT_ALL:
    MOV AH, 2
    INT 21h
    INC DL
    LOOP PRINT_ALL

    LEA DX, n1
    MOV AH, 9
    INT 21h

    MOV CX, 4
    MOV DL, '1'
PRINT_ODD:
    MOV AH, 2
    INT 21h
    ADD DL, 2
    LOOP PRINT_ODD

    LEA DX, n1
    MOV AH, 9
    INT 21h

    MOV CX, 4
    MOV DL, '2'
PRINT_EVEN:
    MOV AH, 2
    INT 21h
    ADD DL, 2
    LOOP PRINT_EVEN

    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN


