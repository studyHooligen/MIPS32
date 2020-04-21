`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 10:44:32
// Design Name: 
// Module Name: mainCtroller
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


module mainController(
    output [2:0] AluCtrl,
    output RegWriteDataSrc,
    output MemWriteEN,
    output Branch,
    output AluSrc,
    output RegWriteAddrSrc,
    output RegWriteEN,
    output Jump,
    input [5:0] OpCode,
    input [5:0] Funct
    );
  reg[9:0] Ctr;
  assign {RegWriteEN,MemWriteEN,RegWriteAddrSrc,AluSrc,RegWriteDataSrc,Branch,Jump,AluCtrl} = Ctr;
  always @(*)
    case (OpCode)
      6'h23:   Ctr <= 10'b1001100010; // lw, +
      6'h08:   Ctr <= 10'b1001000010; // addi, +
      6'h2B:   Ctr <= 10'b0101000010; // sw, +
      6'h04:   Ctr <= 10'b0000010110; // beq, -
      6'h02:   Ctr <= 10'b0000001000; // j
      6'h00:
        case (Funct)                      // R-tpye
          6'h20:   Ctr <= 10'b1010000010; // add
          6'h22:   Ctr <= 10'b1010000110; // sub
          6'h24:   Ctr <= 10'b1010000001; // and
          6'h25:   Ctr <= 10'b1010000011; // or
          6'h2A:   Ctr <= 10'b1010000111; // slt
          default: Ctr <= 10'b1010000000;
        endcase
      default: Ctr <= 10'h0;
    endcase
endmodule
