// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

//Loop Varaibles
@R0
D = M
@COUNT
M = D

@R1
D = M
@ADDVAL
M = D

@RESULT
M = 0

//Repeated Addition
(ADDLOOP)

    @COUNT
    D = M 

    @RESULT
    D;JEQ

    @ADDVAL
    D = M 

    @RESULT
    M = D + M 

    @COUNT
    M = M - 1

    @ADDLOOP
    0;JMP

//Storing The Result
(RESULT)
@RESULT 
D = M

@R2
M = D

//Termination
(END)
@END
0;JMP
