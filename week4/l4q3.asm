;Write an assembly language program to convert a 2-digit hex number in to its equivalent BCD number
    AREA RESET, DATA, READONLY
    EXPORT __Vectors
__Vectors
    DCD 0x40001000
    DCD Reset_Handler
    ALIGN
    AREA mycode, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler
Reset_Handler
    LDR R0,=NUM
    LDR R1,[R0]
    MOV R2, #0
    MOV R3, #10
    MOV R4, R1
    
DIV_LOOP
    CMP R4, R3
    BLO DIV_DONE
    SUB R4, R4, R3
    ADD R2, R2, #1
    B DIV_LOOP
    
DIV_DONE
    LSL R2, R2, #4
    ORR R5, R2, R4
    LDR R0,=RESULT
    STR R5,[R0]
STOP B STOP
NUM DCD 0X15 
    AREA data, DATA, READWRITE
RESULT DCD 0
    END