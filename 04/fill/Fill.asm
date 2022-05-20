// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//Keyboard Input
(START)
@KBD
D = M

//Saving Value
@SCREENVALUE
M = 0
@OPERATION
D;JEQ               //Value == -0 if key Not Pressed

@SCREENVALUE
M = -1               //Value == -1 if key Pressed

//Changing Screen

(OPERATION)
@8191
D = A 

@ROWCOUNT
M = D

@SCREEN
D = D + A

@ROW
M = D

//Row Iteration
(ROWSTART) 

    @SCREENVALUE
    D = M
    
    //Setting All White/Black
    @ROW
    A = M
    M = D 

    @ROW
    M = M - 1

    @ROWCOUNT
    M = M - 1 
    D = M 
    @ROWSTART
    D;JGE

//Check Update
@START
0;JMP

