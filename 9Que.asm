        AREA SwapCode, CODE, READONLY ; Define code section
        ENTRY                        ; Mark entry point
        
        LDR r2, =0X40000000          ; Load address 0X40000000 into r2
        LDR r0, =0x00000000          ; Initialize r0 with 0x00000000
        LDR r1, =0x11112222          ; Initialize r1 with 0x11112222

        SWP r0, r1, [r2]             ; Swap r1 with memory at [r2] and store old memory value in r0

        END                          ; End of program