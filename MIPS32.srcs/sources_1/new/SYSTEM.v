`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/09 11:24:18
// Design Name: 
// Module Name: SYSTEM
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


module SYSTEM(
    input CLK,
    input RST
    );
    wire[31:0] Instr, PC, ReadData, ALURes, MemWriteData;
    wire MemWriteEN;
  MIPS32 mips(ALURes, MemWriteData, MemWriteEN, PC, ReadData, Instr, CLK, RST);
  INSTR_ROM imem(PC[6:2],Instr,CLK);
  DATA_RAM dmem(ALURes[6:2],ReadData,MemWriteData,MemWriteEN,CLK);
endmodule
