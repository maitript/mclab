	AREA SUMOFDIGITS,CODE
SUM RN 1
DIGIT RN 2
QUO RN 3
DIVISOR RN 4
N RN 5
	LDR N,=123
	MOV DIVISOR,#10
	MOV SUM,#0
NEXT_DIGIT
	BL GET_LAST_DIGIT
	ADD SUM,SUM,DIGIT
	MOV N,QUO	//updates value of n by removing last digit
	CMP QUO,#0
	BNE NEXT_DIGIT
GO 	BAL GO
GET_LAST_DIGIT
	MOV QUO,#0
	MOV DIGIT,#0
SUB_AGAIN
	SUBS N,N,DIVISOR	
	ADDPL QUO,QUO,#1
	BPL SUB_AGAIN
	ADDMI DIGIT,N,DIVISOR	//doing this inorder to make the -ve number which was obtained on repeated subtraction, we'll get the remainder basically
	BX LR
	END
