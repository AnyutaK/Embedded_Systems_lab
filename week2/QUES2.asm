;Reverse an array of ten 32 bit numbers in the memory.
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
    LDR R1, =DST
	MOV R2,#10
	ADD R0, R0, #36
          
LOOP
	LDR R3, [R0]        
    STR R3, [R1]        
    SUB R0, R0, #4      
    ADD R1, R1, #4      
    SUBS R2,#1     
    BNE LOOP
STOP 
	B STOP
SRC DCD 0X00A1,0X00A2,0X00A3,0X00A4,0X00A5,0X00A6,0X00A7,0X00A8,0X00A9,0X0A10
	AREA DATASEG,DATA,READWRITE
DST DCD 0
	END
	
	
	
	
	
	
	
	