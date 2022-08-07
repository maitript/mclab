	AREA FIBONACCI,CODE,READONLY
ENTRY
		MOV R1,#1		; b =1
		LDR R2,=TABLE		;answer
		LDR R3,=NUMFIBONACCI	;limit
		LDRB R6,[R3]		
		STRB R1,[R2],#1
		MOV R3,#0		;a=0
		MOV R4,#0		;c=0
		MOV R5,#1		;counter
		SUB R6,R6,#1
BACKK 		ADD R4,R3,R1		;c=a+b
		STRB R4,[R2],#1		;put c in table
		MOV R3,R1		;a=b
		MOV R1,R4		;b=c
		ADD R5,R5,#1		;counter
		CMP R5,R6
		BLS BACKK
GO		B		 GO
NUMFIBONACCI DCB 0X0A
	AREA NUMBER,DATA,READWRITE
TABLE SPACE 60
	END
