;Write an ARM assembly language program to transfer block of ten 32 bit numbers from one memory to another a.
;When the source and destination blocks are non-overlapping b.When the source and destination blocks are overlapping
;A.
	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X40001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=SRC
	LDR R1,=DST
	MOV R2,#10
MOV_LOOP
	LDR R3,[R0],#4
	STR R3,[R1],#4
	SUBS R2,R2,#1
	BNE MOV_LOOP
STOP 
	B STOP
SRC DCD 0X0001,0X0002,0X0003,0X0004,0X0005,0X0006,0X0007,0X0008,0X0009,0X0010
	AREA DATASEG,DATA,READWRITE
DST DCD 0
	END