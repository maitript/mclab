	AREA PALINDROME,CODE,READONLY
ENTRY
		LDR R1, = 12321
		MOV R6,R1         ;
		MOV R2,#10    ;divisor
		MOV R5,#0     ;rev no
		MOV R10,#10   ;cause we need 10 in MLA
LOOP 	BL 	DIV
		MLA R5,R10,R5,R4    ;rev = rev*10 + rem
		CMP R3,#0           ;checking updated no
		MOVNE R1,R3         ;update value of n
		BNE LOOP
		CMP R5,R6           ;compare rev and n
		MOVEQ R7,#1
		MOVNE R7,#0
STOP	B	STOP
DIV 	MOV R3,#0
LOOP2 	SUBS R1,R1,R2   
		ADDPL R3,R3,#1      ;updated no
		BPL LOOP2     
		ADDMI R4,R1,R2      ;remainder
		BX LR
		END
