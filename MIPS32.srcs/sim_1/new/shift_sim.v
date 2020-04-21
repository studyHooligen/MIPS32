`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 16:33:31
// Design Name: 
// Module Name: shift_sim
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


module shift_sim(
    output reg CLK,
    output reg [31:0] shiftData,
    output [31:0] shift2BitsRes
    );
   parameter PERIOD = 10;
    //时钟发生模块
   always begin
      CLK = 1'b0;
      #(PERIOD/2) CLK = 1'b1;
      #(PERIOD/2);
   end
   //实例化移位有符号左移2位模块
   signedShiftLeft #(2,32)sl2(shift2BitsRes,shiftData);
   
   always @(posedge CLK) //每个时钟上升沿移位数据+1
        shiftData = shiftData+1;
  
   initial shiftData = 32'hfffffffa;
endmodule
