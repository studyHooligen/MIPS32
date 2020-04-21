`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 09:51:47
// Design Name: 
// Module Name: DATA_RAM
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


module DATA_RAM (
    input [4:0] addr,
    output [31:0] ReadData,
    input [31:0] WriteData,
    input WriteEN,
    input CLK
    );
    reg[31:0] RAM[0:31];
    assign ReadData = RAM[addr];
    always @(negedge CLK)
        if(WriteEN & ~CLK)
            RAM[addr] = WriteData;
            
    integer i;
    initial
        for(i = 0;i<32;i=i+1)
            RAM[i]=i;
endmodule
