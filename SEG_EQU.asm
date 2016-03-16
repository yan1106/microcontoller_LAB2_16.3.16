;程式功能:四顆七段顯示器顯示數字(2014)
#include "tx3703.inc"

	
	FOUR 	EQU 0E4H  ;11100100b
	ONE  	EQU 0D1H  ;11010001b
	ZERO 	EQU 0B0H  ;10110000b
	TWO	 	EQU 072H  ;01110010b
	
	TEN 	EQU 0EAH  ;01111010b
	
	ROne	EQU 60H	  ;Memory address,右邊數來第一顆七段顯示器
	RTen	EQU 61H	  ;Memory address,右邊數來第二顆七段顯示器		
	LOne	EQU 62H	  ;Memory address,右邊數來第三顆七段顯示器
	LTen	EQU 63H	  ;Memory address,右邊數來第四顆七段顯示器
	
	ORG 000h
	AJMP Start
	ORG 400h
Start:

	MOV P0OE,#11111111b;
	MOV P0,#11111111b;
	
	MOV ROne,#FOUR 	;Memory address ROne 存4 
	MOV RTen,#ONE 	;Memory address RTen 存1
	MOV LOne,#ZERO  ;Memory address LOne 存0
	MOV LTen,#TWO  	;Memory address LTen 存2


S1:
	MOV R2,#20
S2:
	MOV P0,ROne
	ACALL delay_1s
	
	MOV P0,RTen
	ACALL delay_1s
	
	MOV P0,LOne
	ACALL delay_1s
	
	MOV P0,LTen
	ACALL delay_1s

	DJNZ R2,S2

;個位數加到九
	INC ROne
	MOV A,ROne
	CJNE A,#TEN,S1
	MOV ROne,#FOUR	;initialize Digit Four

	AJMP S1
	
delay_1s:
	MOV R5,#10
	D1:
	MOV  R6,#10
	DJNZ R6,$
	DJNZ R5,D1
	RET
	
	END