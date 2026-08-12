;Write a program to subtract two 128 bit numbers
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
	LDR R2,=DIFF        
	MOV R6,#4           
	LDR R3,[R0],#4
	LDR R4,[R1],#4
	SUBS R5,R3,R4        
	STR R5,[R2],#4
UP	LDR R3,[R0],#4
	LDR R4,[R1],#4
	SBCS R5,R3,R4        
	STR R5,[R2],#4
	SUBS R6,R6,#1
	BNE UP
STOP B STOP
N1 DCD 0XA2D44B69,0XDCB2454E,0XF453AB68,0XCC46545A
N2 DCD 0X13254894,0X52532078,0X01241352,0XAB34F561
	AREA mydata,DATA,READWRITE
DIFF DCD 0,0,0,0
	END

