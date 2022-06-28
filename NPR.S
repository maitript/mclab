	AREA NPR,CODE
	MOV R0,#6
	MOV R1,#3
	BL FACT			//computes fact of n
	MOV R3,R2
	MOV R0,#6
	SUB R0,R0,R1
	BL FACT			//computes fact of n-r
	MOV R4,R2
	MOV R5,#0
SUB_AGIAN
	SUBS R3,R3,R4		//n! - (n-r)!
	ADDPL R5,R5,#1
	BPL SUB_AGIAN
	LDR R0,=0X40000000
	STR R5,[R0]
GO	BAL GO
FACT 
	MOV R2,#1
NEXT
	CMP R0,#0
	MULGT R2,R0,R2
	SUBGT R0,R0,#1
	BNE NEXT
	BX LR
	END
	
