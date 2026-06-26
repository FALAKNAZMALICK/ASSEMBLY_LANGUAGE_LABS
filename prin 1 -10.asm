.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV CX, 15   ; Change this line only
    MOV BX, 1

PRINT_LOOP:
    MOV AX, BX
    CALL PRINT_NUMBER

    MOV DL, 13
    MOV AH, 02H
    INT 21H
    MOV DL, 10
    INT 21H

    INC BX
    LOOP PRINT_LOOP

    MOV AH, 4CH
    INT 21H
MAIN ENDP

PRINT_NUMBER PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    MOV CX, 0
    MOV BX, 10

EXTRACT_DIGITS:
    MOV DX, 0
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNE EXTRACT_DIGITS

PRINT_DIGITS:
    POP DX
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    DEC CX
    JNZ PRINT_DIGITS

    POP DX
    POP CX
    POP BX
    POP AX
    RET
PRINT_NUMBER ENDP
END MAIN