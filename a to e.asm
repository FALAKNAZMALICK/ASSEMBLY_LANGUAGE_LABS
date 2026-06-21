
  .MODEL SMALL
.STACK 100h
.DATA

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5    ;;
    MOV DL, 'A'

PRINT_LOOP:
    MOV AH, 2
    INT 21h
    INC DL
    LOOP PRINT_LOOP

    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
