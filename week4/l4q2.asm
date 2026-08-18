;Write an assembly language program to convert a 2-digit BCD number in to its equivalent hexadecimal number.
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
    LDR R0, =NUM
    LDR R1, [R0]
    AND R2, R1, #0x0F
    AND R3, R1, #0xF0
    MOV R3, R3, LSR #4
    MOV R4, #10
    MUL R5, R3, R4
    ADD R6, R5, R2
    LDR R0, =RESULT
    STR R6, [R0]
STOP B STOP
NUM DCD 0x21
    AREA data, DATA, READWRITE
RESULT DCD 0
    END