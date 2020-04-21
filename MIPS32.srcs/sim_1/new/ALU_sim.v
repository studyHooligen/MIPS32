`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/16 10:10:01
// Design Name: 
// Module Name: ALU_sim
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


module ALU_sim(
    output [31:0] ALU_RES,
    output ALU_ZERO,
    output reg [31:0] ALU_I1,
    output reg [31:0] ALU_I2,
    output reg [2:0] ALU_CTRL
    );
    
    //ALU模块实例化
    ALU alu(ALU_RES,ALU_ZERO,ALU_I1,ALU_I2,ALU_CTRL);
    
    initial
    begin
        ALU_I1 = 32'h5f5f2a2a;
        ALU_I2 = 32'h1a1ac9c9;
    end
    
    always begin
            ALU_CTRL = 3'b001; //逻辑与
        #10 ALU_CTRL = 3'b010; //算术加
        #10 ALU_CTRL = 3'b011; //逻辑或
        #10 ALU_CTRL = 3'b110; //算术减
        #10 ALU_CTRL = 3'b111; //左移
        #10;
    end
    
endmodule
