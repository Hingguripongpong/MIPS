module InstructionMemory(
    input wire clk,           
    input wire [31:0] address,    // 명령어 주소
    output reg [31:0] instruction // 읽은 명령어
);

    reg [31:0] memory [0:1023];    // 1024개의 32비트 명령어 메모리 위치
    
    always @(posedge clk) begin
        // 주어진 주소에서 명령어 읽기
        instruction <= memory[address];
    end


    initial begin
        // 임의의 메모리 기입
        //memory[0] = 32'b00100001000010000000000000001000;     // addi $t0, $t0, 8
        //001000 01000 01000 0000000000001000
        //memory[4] = 32'b00100001001010010000000000001001;     // addi $t1, $t1, 9
        //001000 01001 01001 0000000000001001        
        //memory[8] = 32'b00000001001010000101000000100000;    // add $t2, $t1, $t0
        //000000 01001 01000 01010 00000 100000
        //memory[12] = 32'b00000001010010010101100000100010;    // sub $t3, $t2, $t1
        //000000 01010 01001 01011 00000 100010
        
        //memory[0] = 32'b00100001000010000000000000000000;     // addi $t0, $t0, 0
        //001000 01000 01000 0000000000000000
        //memory[4] = 32'b00100001001010010000000000000001;     // addi $t1, $t1, 1
        //001000 01001 01001 0000000000000001        
        //memory[8] = 32'b00000001000010010101000000100100;    // and $t2, $t0, $t1
        //000000 01000 01001 01010 00000 100100
        //memory[12] = 32'b00000001000010010101100000100101;    // or $t3, $t0, $t1
        //000000 01000 01001 01011 00000 100101
       
        //memory[0] = 32'b00100001000010000000000000001000;     // addi $t0, $t0, 8
        //001000 01000 01000 0000000000001000
        //memory[4] = 32'b00100001001010010000000000001001;     // addi $t1, $t1, 9
        //001000 01001 01001 0000000000001001    
        //memory[8] = 32'b10001101001010100000000000011000;    // lw $t2, 24($t1)
        //100011 01001 01010 0000000000011000
        //memory[12] = 32'b10101101000010000000000000000010;    // sw $t0, 2($t0)
        //101011 01000 01000 0000000000000010
        //memory[16] = // lw $t3, 1($t3)
        
        memory[0] = 32'b00100001000010000000000000001000;     // addi $t0, $t0, 8
        //001000 01000 01000 0000000000001000
        memory[4] = 32'b00100001001010010000000000001000;     // addi $t1, $t1, 8
        //001000 01001 01001 0000000000001000    
        memory[8] = 32'b00010001000010010000000001100100;     // beq $t0, $t1, 100
        //000100 01000 01001 0000000001100100
        memory[12] = 32'b00000001001010000101100000100000;    // add $t3, $t1, $t0
        //000000 01001 01000 01011 00000 100000
        memory[16] = 32'b00000001001010010101100000100000;    // add $t3, $t1, $t1
        //000000 01001 01001 01011 00000 100000
        memory[420] = 32'b00000001001010000101000000100000;   // add $t2, $t1, $t0
        //000000 01001 01000 01010 00000 100000
        
        //memory[0] = 32'b00100001000010000000000000001000;       // addi $t0, $t0, 8
        //001000 01000 01000 0000000000001000
        //memory[4] = 32'b00100001001010010000000000000100;       // addi $t1, $t1, 4
        //001000 01001 01001 0000000000001000  
        //memory[16] = 32'b00000001001010000101000000101010;      // slt $t2, $t1, $t0
        //000000 01001 01000 01010 00000 101010
        
    end

endmodule
