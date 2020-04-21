`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 09:59:50
// Design Name: 
// Module Name: ROM_sim
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


module ROM_sim(
    output [4:0] addr,
    output [31:0] data
    );
    reg[4:0] simAddr;
    reg CLK;
    assign addr = simAddr;
    
    //实例化指令存储器
    INSTR_ROM rom(simAddr,data,CLK);
    
    initial
    begin
        simAddr = 0; //初始化地址为0
    end
    
   parameter PERIOD = 10;
   always begin     //时钟生成模块
      CLK = 1'b1;
      #(PERIOD/2) CLK = 1'b0;
      #(PERIOD/2);
   end
   
    always @(negedge CLK)  //时钟下降沿改变地址
    begin
        simAddr = simAddr+1; //地址递增
        if(simAddr == 32) simAddr = 0;  //地址溢出
    end
endmodule
