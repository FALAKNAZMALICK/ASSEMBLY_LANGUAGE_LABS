.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 'Enter first number: $'
    MSG2 DB 0Dh, 0Ah, 'Enter second number: $'
    MSG3 DB 0Dh, 0Ah, 'Enter third number: $'
    RES_MSG DB 0Dh, 0Ah, 'Sum of all numbers: $'
    a DB ?
    b DB ?
    c DB ?
    SUM DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, MSG1
    MOV AH, 9
    INT 21h
    CALL READ_DIGIT
    MOV a, AL

    LEA DX, MSG2
    MOV AH, 9
    INT 21h
    CALL READ_DIGIT
    MOV b, AL

    LEA DX, MSG3
    MOV AH, 9
    INT 21h
    CALL READ_DIGIT
    MOV c, AL

    MOV AL, a
    ADD AL, b
    ADD AL, c
    MOV SUM, AL

    LEA DX, RES_MSG
    MOV AH, 9
    INT 21h

    MOV AL, SUM
    MOV AH, 0
    CALL PRINT_NUM

    MOV AH, 4Ch
    INT 21h
MAIN ENDP

READ_DIGIT PROC
    MOV AH, 1
    INT 21h
    SUB AL, '0'
    RET
READ_DIGIT ENDP

PRINT_NUM PROC
    PUSH BX
    PUSH CX
    PUSH DX

    MOV CX, 0
    MOV BX, 10

    CMP AX, 0
    JNE START_CONVERSION
    MOV DL, '0'
    MOV AH, 2
    INT 21h
    JMP END_PRINT

START_CONVERSION:
    CMP AX, 0
    JE PRINT_DIGITS
    MOV DX, 0
    DIV BX
    PUSH DX
    INC CX
    JMP START_CONVERSION

PRINT_DIGITS:
    CMP CX, 0
    JE END_PRINT
    POP DX
    ADD DL, '0'
    MOV AH, 2
    INT 21h
    DEC CX
    JMP PRINT_DIGITS

END_PRINT:
    POP DX
    POP CX
    POP BX
    RET
PRINT_NUM ENDP

END MAIN

