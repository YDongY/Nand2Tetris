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

// Put your code here.

// for (i=0 ;i<256 ; i++)

// addr = SCREEN
// n = 8192
// i = 0

// LOOP:
//   if i > n goto END
//   RAM[addr] = -1
//   addr = addr + 32
//   i = i + 1
//   goto LOOP
//END:
//   goto END

@SCREEN
D=A
@START
M=D // START = 16384

@24575
D=A
@STOP
M=D  // STOP = 24575

(LOOP)
    @KBD
    D=M
    @BLACK // if RAM[KDB] !=0 to black
    D;JNE

    // to write
    @SCREEN
    D=A
    @START
    D=D-M // if START - SCREEN > 0 to write
    @LOOP
    D;JGT

    @START
    A=M
    M=0  // RAM[START] = 0000 0000 0000 0000

    @START
    M=M-1
    @LOOP
    0;JMP

    (BLACK)
        // 判断屏幕是否为 black
        @STOP
        D=M
        @START
        D=D-M // if STOP - START < 0 to black
        @LOOP
        D;JLT

        @START
        A=M
        M=-1 // RAM[addr] = 1111 1111 1111 1111

        @START
        M=M+1

        @LOOP
        0;JMP


