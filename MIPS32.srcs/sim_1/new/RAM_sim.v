`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/15 15:30:31
// Design Name: 
// Module Name: RAM_sim
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


module RAM_sim(
    output reg CLK,
    output reg [4:0] addr,
    output [31:0] dataR,
    output reg [31:0] dataW
    );
    reg WriteEN;
    DATA_RAM ram(addr,dataR,dataW,WriteEN,CLK);
    
    initial 
    begin
    WriteEN = 0;
    addr = 2;
    dataW = 0;
    end
    
    always @(posedge CLK)
    begin   //写使能做时钟二分频
        WriteEN = ~WriteEN;
    end
    
    always @(posedge WriteEN)
    begin  //写使能上升沿写数据+1
        dataW = dataW +1;
        if(dataW == 5)  //为测试方便，测试数据5循环
            dataW = 0;
    end
    
    parameter PERIOD = 10;
    always begin     //时钟生成模块
      CLK = 1'b1;
      #(PERIOD/2) CLK = 1'b0;
      #(PERIOD/2);
    end
endmodule
