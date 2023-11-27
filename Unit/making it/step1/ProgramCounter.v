`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/27 23:03:13
// Design Name: 
// Module Name: ProgramCounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ProgramCounter(
    input wire clk,        // 클락 신호
    
    input wire [31:0] branchAddress, // branch 목적지 주소
    input wire branch,     // branch 여부
    
    input wire [31:0] jumpAddress,   // jump 목적지 주소
    input wire jump,       // jump 여부
    
    input wire [31:0] PCWriteValue,  // PC에 쓰여질 값
    input wire PCWrite,    // Control unit
    
    output reg [31:0] pc    // 현재 PC 값
);

    always @(posedge clk) begin
        if (jump)          // jump 활성화
            pc <= jumpAddress;  // jump 목적지 주소 넣기
        
        else if (branch)   // branch 활성화
            pc <= pc + branchAddress;  // branch 목적지 주소로 이동
        
        else if (PCWrite)  // PCwrite Control unit이 활성화되면
            pc <= PCWriteValue;  // 그 값으로 pc 덮어쓰기
    end

endmodule
