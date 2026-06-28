.MODEL SMALL
.STACK 100h

.DATA
    SUM DW 0 
    COUNT DW 1
    MSG DB 'Final Sum: $'
    COUNT_MSG DB 0Dh, 0Ah, 'Count: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 0
    MOV CX, 1

RUN_LOOP:
    ADD AX, CX
    INC CX

    CMP AX, 1000
    JLE RUN_LOOP

    DEC CX
    MOV SUM, AX
    MOV COUNT, CX

    LEA DX, MSG
    MOV AH, 9
    INT 21h

    MOV AX, SUM
    CALL PRINT_NUM

    LEA DX, COUNT_MSG
    MOV AH, 9
    INT 21h

    MOV AX, COUNT
    CALL PRINT_NUM

    MOV AH, 4Ch
    INT 21h
MAIN ENDP

PRINT_NUM PROC
    MOV CX, 0
    MOV BX, 10

    CMP AX, 0
    JNE CONVERT_LOOP
    MOV DL, '0'
    MOV AH, 2
    INT 21h
    RET

CONVERT_LOOP:
    CMP AX, 0
    JE PRINT_DIGITS
    MOV DX, 0
    DIV BX
    PUSH DX
    INC CX
    JMP CONVERT_LOOP

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
    RET
PRINT_NUM ENDP

END MAIN


