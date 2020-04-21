`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 09:51:47
// Design Name: 
// Module Name: INSTR_ROM
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


module INSTR_ROM(
    input [4:0] addr,   //地址线
    output reg[31:0] data,  //32位数据线
    input CLK   //同步时钟
    );
    reg[31:0] ROM [0:31];   //32*32存储单元
    
    always@(posedge CLK)    //在时钟上升沿读出数据or指令
    begin
        data = ROM[addr];
    end
    
    integer i;
    initial
    begin
        for(i=0;i<32;i=i+1) //默认初始化存储单元内容为地址
            ROM[i]=i;
            
        //初始化存储单元后读入指令文件
        $readmemh("D:/CollegeHomework/MIPS32/executeCode.txt",ROM);
    end
endmodule
