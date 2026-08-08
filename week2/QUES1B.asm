;Write an ARM assembly language program to transfer block of ten 32 bit numbers from one memory to another a.
;When the source and destination blocks are non-overlapping b.When the source and destination blocks are overlapping
;b.
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
	LDR R0, =SRC     
    LDR R1, =SRC
	ADD R0, R0, #(N-1)*4  ; R0 points to the last element of SRC
	ADD R1, R1, #(N-1+S)*4 ;	
    MOV R2, #10         
LOOP
    LDR R3, [R0],#-4        
    STR R3, [R1],#-4        
    SUBS R2, R2, #1      
    BNE LOOP             

STOP
    B STOP
N EQU 10
S EQU 2
	AREA MYDATA,DATA,READWRITE
SRC 
	DCD 0X00A1,0X00A2,0X00A3,0X00A4,0X00A5,0X00A6,0X00A7,0X00A8,0X00A9,0X0A10
	SPACE 8
	END