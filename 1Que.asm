	AREA QUE1,CODE,READONLY
START		
	MOV     r1, #0          
    MOV     r2, #15         
    MOV     r3, #12         
    
    MVN     r0, r1          
    AND     r4, r0, r2      
    EOR     r4, r4, r3      
    END
