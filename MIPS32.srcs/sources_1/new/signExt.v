`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/16 11:59:33
// Design Name: 
// Module Name: signExt
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


module signExt #(parameter resW = 32,srcW = 16)(
    output [resW-1:0] extO,
    input [srcW-1:0] extI
    );
    assign extO = {{(resW-srcW){extI[srcW-1]}}, extI};
endmodule
