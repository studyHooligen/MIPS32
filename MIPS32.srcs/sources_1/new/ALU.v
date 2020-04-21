`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 09:44:52
// Design Name: 
// Module Name: ALU
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


module ALU(
    output reg [31:0] RES,
    output ZERO,
    input [31:0] in1,
    input [31:0] in2,
    input [2:0] CTRL
    );
  assign ZERO = (RES == 0);	   
  always @(*) begin
    case (CTRL)     // 4-bit in the textbook
      3'b001:  RES = in1 & in2;
      3'b010:  RES = in1 + in2;
      3'b011:  RES = in1 | in2;
      3'b110:  RES = in1 - in2; 
      3'b111:  RES = in1 < in2;  
      default: RES = 32'hFFFFFFFF;
    endcase 
  end
endmodule
