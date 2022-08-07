	AREA BUBBLE,CODE
	LDR R0, =ARRAY
	LDMIA R0, {r1-r5}
	LDR R0, =answer
	STMIA R0, {r1-r5}	;IN ANSWER r1 has 5, r2 has 4...
	
	LDR R0,=N		;size of array
	LDRB R1,[R0]   		; r1 = 5 = i
	SUB R1,R1,#1		;decrement i
NEXT_PASS
	MOV R2,R1 		; make a copy, this is j
	LDR R3,=answer		
NEXT_CMP
	LDR R4,[R3],#4		
	LDR R5,[R3]
	CMP R4,R5
	STRPL R4,[R3]
	STRPL R5,[R3,#-4]
	SUBS R2,R2,#1		;decrement j after one comparison
	BNE NEXT_CMP
	CMP R1,#6		;if i gets exhausted quit
	BEQ GO
	SUBS R1,R1,#1
	BNE NEXT_PASS
GO 	BAL GO
N DCB 5
ARRAY DCD 5,4,3,2,1
	AREA ARR,DATA
answer space 20
	END
