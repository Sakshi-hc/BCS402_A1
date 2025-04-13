        AREA SwapCode, CODE, READONLY 
ENTRY                      
        
        LDR r2, =0X40000000          
        LDR r0, =0x00000000          
        LDR r1, =0x11112222        

        SWP r0, r1, [r2]            

        END                       
