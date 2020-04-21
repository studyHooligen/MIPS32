`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 17:01:50
// Design Name: 
// Module Name: mainCTRL_sim
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


module mainCTRL_sim(
    output reg CLK,
    output [31:0] INSTR,
    output Jump,
    output RegWriteDataSrc,
    output MemWriteEN,
    output Branch,
    output [2:0] AluCtrl,
    output AluSrc,
    output RegWriteSrc,
    output RegWriteEN
    );
    reg[4:0] simAddr;
    //实例化指令存储器
    INSTR_ROM rom(simAddr,INSTR,CLK);
    //实例化主控制器
    mainController mainCtrl(AluCtrl,
            RegWriteDataSrc,MemWriteEN,
            Branch,AluSrc,
            RegWriteSrc,RegWriteEN,
            Jump,
            INSTR[31:26],INSTR[5:0]);
    
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
        if(simAddr == 12) simAddr = 0;  //地址溢出
    end
endmodule
