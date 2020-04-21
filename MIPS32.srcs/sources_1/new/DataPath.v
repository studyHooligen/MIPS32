`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 11:10:25
// Design Name: 
// Module Name: DataPath
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


module DataPath(
    output [31:0] AluRes,
    output Zero,
    output [31:0] WriteData,
    output [31:0] PC,
    input [31:0] Instr,
    input [31:0] ReadData,
    input [2:0] AluCtrl,
    input MemToReg,
    input PCSrc,
    input AluSrc,
    input RegWriteSrc,
    input RegWriteEN,
    input Jump,
    input CLK,
    input RST
    );
  wire[31:0] PCN, PCB, PCPlus4, PCBranch, SignImm, SignImmSh, SrcA, SrcB, Result; 
  wire[4:0]  WriteReg;
  PCReg #(32) pcreg(PC, PCN, CLK, RST);
  GPR32     generalPurposerRegister(SrcA, WriteData, 
                 Result, Instr[25:21], Instr[20:16], WriteReg,
                 RegWriteEN, CLK, RST);
  signExt     se(SignImm, Instr[15:0]);
  ALU         alu(AluRes, Zero, SrcA, SrcB, AluCtrl);
  SL2         immsh(SignImmSh, SignImm);
  Adder       pcadd1(PCPlus4, PC, 32'h4);
  Adder       pcadd2(PCBranch, PCPlus4, SignImmSh);
  MUX2 #(32)  pcbrmux(PCB, PCPlus4, PCBranch, PCSrc);
  MUX2 #(32)  pcmux(PCN, PCB, {PCPlus4[31:28], Instr[25:0], 2'b00}, Jump);
  MUX2 #(32)  srcbmux(SrcB, WriteData, SignImm, AluSrc);
  MUX2 #(32)  resmux(Result, AluRes, ReadData, MemToReg);
  MUX2 #(5)   wrmux(WriteReg, Instr[20:16], Instr[15:11], RegWriteSrc);
    
endmodule

//module PCReg #(parameter width=32)
//          (output reg[width-1:0] Q, input[width-1:0] D, input CLK, Reset);
//  always @(negedge CLK, posedge Reset) //指令指针在下降沿修改
//    if (Reset) Q <= 0;
//    else       Q <= D;
//endmodule

//module SignExt(output[31:0] y, input[15:0] a);
//  assign y = {{16{a[15]}}, a};
//endmodule

module SL2(output[31:0] y, input[31:0] a);
  assign y = {a[31], a[28:0], 2'b00};
endmodule

module Adder(output[31:0] y, 
             input[31:0] a, b);
  assign y = a + b;
endmodule

module MUX2 #(parameter width=8)
       (output[width-1:0] y, 
        input[width-1:0] d0, d1,
        input s);
  assign y = s ? d1 : d0;
endmodule
