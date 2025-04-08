	AREA BitCounter, CODE, READONLY
start
    LDR R0, =0xF0F0F0F0   ; Example 32-bit input number in R0
    MOV R1, #0            ; R1 will hold the count of set bits
    MOV R2, #32           ; Number of bits to check (32 bits in a 32-bit integer)

count_loop
    TST R0, #1            ; Test the least significant bit (LSB) of R0
    ADDNE R1, R1, #1      ; If LSB is 1, increment the count in R1
    MOV R0, R0, LSR #1    ; Logical shift R0 to the right by 1 (using barrel shifter)
    SUBS R2, R2, #1       ; Decrement the bit counter (R2)
    BNE count_loop        ; If R2 is not zero, repeat the loop

    ; At this point, R1 holds the number of set bits in the input value

    END