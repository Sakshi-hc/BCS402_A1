	AREA SwapValues, CODE, READONLY
ENTRY
    MOV R0, #5        ; Load first number into R0
    MOV R1, #10       ; Load second number into R1

    ; Swap R0 and R1 using XOR
    EOR R0, R0, R1    ; R0 = R0 XOR R1
    EOR R1, R0, R1    ; R1 = R0 XOR R1
    EOR R0, R0, R1    ; R0 = R0 XOR R1

    END