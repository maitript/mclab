	AREA SUBSTRING,CODE,READONLY
CNT RN 7
ENTRY
		LDR R1,=M	;big
		LDR R2,=S	;small
		MOV R12,R2	;copy of small
		MOV CNT,#0	;no of times small occurs 
		
LOOP 		LDRB R3,[R1]		;take letter of big
		LDRB R4,[R2]		;take letter of small
		CMP R4,#0		;see if small is zero
		ADDEQ CNT,CNT,#1	;inrement count
		MOVEQ R2,R12		;load small back
		BEQ LOOP		
		CMP R3,R4		
		ADDEQ R2,R2,#1		;when equal pointer of small++
		MOVNE R2,R12		;else load small back
		ADD R1,R1,#1		;pointer of big++
		BEQ LOOP
		CMP R3,#0		;if big gets over exit or else branch to loop
		BEQ STOP
		BNE LOOP
STOP		B STOP
M 		DCB "ABCABC",0
S 		DCB "ABC",0
		END
