;Write an assembly language program to find LCM of two numbers
	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler

STOP 
	B STOP
	AREA data,DATA,READWRITE

	END
  AREA    RESET, DATA, READONLY
        EXPORT  __Vectors

__Vectors
        DCD     0x10001000
        DCD     Reset_Handler

        AREA    MYCODE, CODE, READONLY
        ENTRY
        EXPORT  Reset_Handler

Reset_Handler

START
        LDR     R0, =A             ; R0 -> A
        LDR     R1, =B             ; R1 -> B
        LDR     R2, =RESULT        ; R2 -> RESULT

        LDR     R4, [R0]           ; R4 = A
        LDR     R5, [R1]           ; R5 = B

        MOV     R6, #1             ; i = 1

LOOP
        MUL     R7, R6, R4         ; R7 = i * A

        MOV     R8, R7             ; R8 = i * A

MOD
        CMP     R8, R5
        BLO     CHECK              ; if remainder < B

        SUB     R8, R8, R5         ; remainder -= B
        B       MOD

CHECK
        CMP     R8, #0             ; remainder == 0?
        BEQ     DONE               ; yes -> exit

        ADD     R6, R6, #1         ; i++
        B       LOOP

DONE
        STR     R7, [R2]           ; RESULT = i * A

STOP
        B       STOP

        AREA    DATASEC, DATA, READWRITE

A       DCD     12
B       DCD     18

RESULT  SPACE   4

        END