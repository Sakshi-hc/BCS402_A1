        AREA MyCode, CODE, READONLY   ; Define a code section
        ENTRY                       ; Mark the entry point

        LDR r1, =0X40000000         ; Load base memory address into r1
        LDR r5, [r1]                ; Load data at address 0X40000000 (10) into r5
        LDR r6, [r1, #4]            ; Load data at address 0X40000004 (20) into r6
        LDR r7, [r1, #8]            ; Load data at address 0X40000008 (30) into r7

        ADD r2, r5, r6              ; Add r5 (10) and r6 (20), store result (30) in r2
        SUB r2, r2, r7              ; Subtract r7 (30) from r2 (30), result is 0

        END                         ; End of program