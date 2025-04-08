        AREA BinarySearch, CODE, READONLY   ; Define code section
        ENTRY                               ; Mark entry point

        LDR r0, =SortedArray                ; Load the base address of the array into r0
        LDR r1, =ArraySize                  ; Load the address of the size of the array into r1
        LDR r1, [r1]                        ; Dereference the address of ArraySize to get the size value
        LDR r2, =SearchKey                  ; Load the search key into r2
        
        MOV r3, #0                          ; Initialize low (r3) to 0
        SUB r4, r1, #1                      ; Initialize high (r4) to ArraySize - 1

BinarySearchLoop
        CMP r3, r4                          ; Compare low and high pointers
        BGT NotFound                        ; If low > high, exit (key not found)
        
        ADD r5, r3, r4                      ; Calculate mid index: (low + high) / 2
        ASR r5, r5, #1                      ; Perform arithmetic shift to divide by 2
        
        LDR r6, [r0, r5, LSL #2]            ; Load the array[mid] value into r6 (each element is 4 bytes)
        CMP r6, r2                          ; Compare array[mid] with search key
        BEQ Found                           ; If array[mid] == key, exit (key found)
        BLT AdjustLow                       ; If array[mid] < key, adjust low pointer
        BGT AdjustHigh                      ; If array[mid] > key, adjust high pointer

AdjustLow
        ADD r3, r5, #1                      ; low = mid + 1
        B BinarySearchLoop                  ; Repeat loop

AdjustHigh
        SUB r4, r5, #1                      ; high = mid - 1
        B BinarySearchLoop                  ; Repeat loop

Found
        MOV r7, r5                          ; Store the index of the key in r7
        B End                               ; Exit

NotFound
        MOV r7, #-1                         ; Store -1 in r7 to indicate not found

End


        AREA DataSection, DATA, READWRITE  ; Define data section

SortedArray  DCD 10, 20, 30, 40, 50, 60, 70 ; Example sorted array
ArraySize    DCD 7                          ; Define the size of the array (changed to DCD)
SearchKey    DCD 40                         ; Define the key to be searched
        END