; A fix of autocomplete next adress in ASM mode

NDX     = $C6
KEYD    = $0277
CHROUT  = $1EA0
SMOVE   = $9582
INBUFF  = $0200
CHRPNT  = $0231

*= $A008

AUTOCMP LDA #$0D
        JSR CHROUT
        LDA #"."
        JSR CHROUT
        LDX 0
LOOP    LDA KEYD,X
        STA INBUFF,X
        LDA #" "
        JSR CHROUT
        INX
        TXA
        CMP NDX
        BEQ DONE
        JMP LOOP
DONE    LDX #$00
        STX CHRPNT
        LDX NDX              ; point at start of input buffer
        JMP SMOVE
