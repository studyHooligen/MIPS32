`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 11:46:38
// Design Name: 
// Module Name: testBench
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


module testBench(    );
    
   parameter PERIOD = 10;
    reg CLK;
   always begin
      CLK = 1'b0;
      #(PERIOD/2) CLK = 1'b1;
      #(PERIOD/2);
   end
   
   reg RST;
   initial
   begin
   CLK <= 0;
   RST <= 1;
   #(PERIOD/2) CLK <= 1;
   #(PERIOD/2) RST <= 0;
   end
   
   SYSTEM test(CLK,RST);
endmodule
