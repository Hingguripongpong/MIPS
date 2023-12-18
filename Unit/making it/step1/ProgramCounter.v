module ProgramCounter(
    input wire clk,        // ?��?�� ?��?��
    input wire rst,
    input wire PCSrc,
    input wire [31:0] PCWriteValue,  // PC?�� ?��?���? �?
    input wire PCWrite,    // Control unit
    
    output reg [31:0] pc    // ?��?�� PC �?
);

    always @(posedge clk, posedge rst) begin
        if (rst == 1)
            pc <= 0;
    
        else if (PCWrite)  // PCwrite Control unit?�� ?��?��?��?���?
            pc <= PCWriteValue;  // �? 값으�? pc ?��?��?���?
    end

endmodule
