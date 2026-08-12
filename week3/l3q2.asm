;Write a program to add two 128 bit numbers stored in code segment and store the result in data segment.
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
	LDR R0,=N1
	LDR R1,=N2
	LDR R2,=SUM
	MOV R6,#4
UP LDR R3,[R0],#4
	LDR R4,[R1],#4
	ADCS R5,R3,R4
	STR R5,[R2],#4
	SUB R6,#1
	TEQ R6,#0
	BNE UP
	ADC R7,#0
	STR R7,[R5]
STOP B STOP
N1 DCD 0X1A2B,0X3C4D,0X5E6F,0XA1B2
N2 DCD 0XC3D4,0XE5F6,0X1234,0X5678
	AREA mydata,DATA,READWRITE
SUM DCD 0,0,0,0
	END
