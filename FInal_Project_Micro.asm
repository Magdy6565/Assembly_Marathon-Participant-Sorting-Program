include 'emu8086.inc'

JMP START

DATA SEGMENT     ; Declare ALl variables and Arryas needed 
    	Limit            DW     25 
    	X                DB     1
    	Y                DB     2                                                             
	Number_Of_Player     DB  25 DUP (?)
	Time_Of_Player       DB  25 DUP (?)
	Welcome_Message_1    DB 0DH,0AH,'Welocme to Marathon Results Program ',0AH,0DH,0
	Welcome_Message_2    DB 0DH,0AH,'Enter 1)CONTINUE  2)EXIT ',0AH,0DH,0    
	Input_Message_1      DB 0DH,0AH,'Please !Enter the Numbers of the marathon players : ',0AH,0DH,0
	Input_Message_2      DB 0DH,0AH,'Please !Enter the Time for each player: ',0AH,0DH,0 
	Input_Message_3      DB 0DH,0AH,'Time of players after being  sorted: ',0AH,0DH,0
	                               
DATA ENDS  

CODE SEGMENT   
    
        	ASSUME DS:DATA CS:CODE     
START:	    MOV AX, DATA
	    	MOV DS, AX  ; Ds points to Data segment                    
	   
	    	DEFINE_SCAN_NUM           
        	DEFINE_PRINT_STRING 
        	DEFINE_PRINT_NUM
        	DEFINE_PRINT_NUM_UNS
            LEA SI,Welcome_Message_1
            CALL PRINT_STRING;
            MOV SI, 0




WELCOME:                  
                	        LEA SI,Welcome_Message_2
                	    	CALL PRINT_STRING;
                	        MOV SI, 0
                	        CALL SCAN_NUM
                	        CMP CL,Y
                	        JE  ENDING
                	        
                	    	LEA SI,Input_Message_1
                	    	CALL PRINT_STRING;: This instruction calls the PRINT_STRING function to print the string stored at the address in SI.
                	    	MOV SI, 0
	     
	                  
	                  ; Dlw2ty 3mlna 2 arrays of sixe 25 esmhm Number_Of_Player w Time_Of_Player   w  variable Limit =25
	                  ;  use of Limit  -->  daymen h increment  si w  compare m3 el Limit  3l4an lw si wslt l 25 ytl3 mn el loop
	     
	     
	     
Scanning_player_numbers:  	CALL SCAN_NUM ; Hna byscan number  w y3mlha store fel  -->  (CL)  
        	                MOV Number_Of_Player[SI],CL
                        	INC SI 
                        	; PRINT 0AH and PRINT 0DH are used to insert a line break, ensuring that the next output appears on a new line. 
                        	PRINT 0AH      
                        	PRINT 0DH 
                        	;we need to compare si with LIMIT to check we are scanning only 25 number of players  
                        	; we use the initialized var Limit with value equal 25       
                        	CMP SI,Limit 
                        	JNE Scanning_player_numbers
       
        
        
	    	
	    	
                	    	LEA SI,Input_Message_2
                	    	CALL PRINT_STRING
                	    	MOV SI, 0   ; si = 0  3l4an hst5dmha eny a increement fel array bta3t el time of players
	    	
	    	
	    	
	    	
	    	
	    	
	   
Scanning_player_Times:  	CALL SCAN_NUM 
                        	MOV Time_Of_Player[SI],CL
                        	INC SI  
                        	PRINT 0AH       
                        	PRINT 0DH         
                        	CMP SI,Limit 
                        	JNE Scanning_player_Times  
	    	
	    	DEC Limit            
	    	MOV CX, Limit                





Loop1:  	MOV SI, 0       
	    
	   
Loop2:  	MOV  AL, Time_Of_Player[SI]
	    	MOV  DL, Number_Of_Player[SI]
	    	INC  SI
	    	CMP  Time_Of_Player[SI], AL
	    	JA   Loop3
	    	XCHG AL, Time_Of_Player[SI]
	    	MOV  Time_Of_Player[SI-1], AL
	    	XCHG DL, Number_Of_Player[SI]
        	MOV  Number_Of_Player[SI-1], DL  
        
Loop3:   	CMP  SI, CX
	    	JL   Loop2 
	    	LOOP Loop1    ; LOOP  -->   DEC  CX    JNZ   Loop1
	    
	    	INC Limit ; Return it to is original value =25  

	    	LEA SI,Input_Message_3
	    	CALL PRINT_STRING
	    	MOV SI, 0   
	    	MOV AH,0 
	    





              ; Printing Output  Results



Printing_Results:    	MOV AL,Number_Of_Player[SI]     
                    	CALL PRINT_NUM_UNS; calls a subroutine named PRINT_NUM_UNS, which prints the value stored in AL as an unsigned number.    
                    	PRINT 09H ;It adds a tab between the two printed values.           
                    	MOV AL,Time_Of_Player[SI]
                    	CALL PRINT_NUM_UNS
                    	PRINT 0AH             
                    	PRINT 0DH   
                    	INC SI 
                    	CMP SI,Limit 
                    	JNE Printing_Results
                    	JMP   WELCOME


ENDING:    CODE ENDS
           END START
           ret



