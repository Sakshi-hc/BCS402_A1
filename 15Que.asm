        AREA BinarySearch, CODE, READONLY  
ENTRY                               

        LDR r0, =SortedArray               
        LDR r1, =ArraySize                  
        LDR r1, [r1]                        
        LDR r2, =SearchKey                  
        
        MOV r3, #0                          
        SUB r4, r1, #1                      

BinarySearchLoop
        CMP r3, r4                          
        BGT NotFound                        
        
        ADD r5, r3, r4                      
        ASR r5, r5, #1                      
        
        LDR r6, [r0, r5, LSL #2]           
        CMP r6, r2                     
        BEQ Found                           
        BLT AdjustLow                       
        BGT AdjustHigh                      

AdjustLow
        ADD r3, r5, #1                      
        B BinarySearchLoop                 

AdjustHigh
        SUB r4, r5, #1                     
        B BinarySearchLoop                 

Found
        MOV r7, r5                          
        B End                             

NotFound
        MOV r7, #-1                        

End


        AREA DataSection, DATA, READWRITE

SortedArray  DCD 10, 20, 30, 40, 50, 60, 70 ; Example sorted array
ArraySize    DCD 7                          ; Define the size of the array (changed to DCD)
SearchKey    DCD 40                         ; Define the key to be searched
        END
