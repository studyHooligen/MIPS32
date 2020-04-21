`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/16 12:04:57
// Design Name: 
// Module Name: signExt_sim
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


module signExt_sim(
    output [31:0] extRES,
    output reg [15:0] extSrc,
    output reg CLK
    );
    parameter PERIOD = 10;
    always begin     //时钟生成模块
    CLK = 1'b1;
    #(PERIOD/2) CLK = 1'b0;
    #(PERIOD/2);
    end
    
    signExt#(32,16)signExtension(extRES,extSrc);
    initial extSrc = 16'b1111111111111010;    
    always@(posedge CLK)
        extSrc = extSrc+1;
endmodule
