;FORE EVER
.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC            
    MOV AX, 1       
    MOV BX, 1        

FOREVER:
    INC BX
    MUL BX           
    JMP FOREVER

MAIN ENDP            
END MAIN



