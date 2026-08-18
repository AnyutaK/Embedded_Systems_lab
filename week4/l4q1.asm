;Write an ARM assembly language program to covert 2-digit hexadecimal number in ASCII.(Ex: input:0x21, output=0x3231)
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
	LDR R3,=RESULT
	LDRB R1,[R0]
	AND R2,R1,#0x0F
	CMP R2,#09
	BLO DOWN
	ADD R2,#07
DOWN
	ADD R2,#0x30
	STRB R2,[R3]
	AND R3,R1,#0xF0
	MOV R3,R3,LSR#04
	CMP R3,#09
	BLO DOWN1
	ADD R3,#07
DOWN1
	ADD R3,#0x30
	LDR R0,=RESULT
	STRB R3,[R0,#01]
STOP B STOP
NUM DCD 0X21
	AREA data, DATA, READWRITE
RESULT DCD 0
	END