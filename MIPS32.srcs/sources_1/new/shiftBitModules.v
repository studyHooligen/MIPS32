`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 16:23:40
// Design Name: 
// Module Name: shiftBitModules
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


module signedShiftLeft #(parameter shiftBits = 2,
                            dataWidth = 32)(
                        output[dataWidth-1:0] shiftRes, 
                        input[dataWidth-1:0] shiftSrc);
    assign shiftRes = {shiftSrc[dataWidth-1], shiftSrc[(dataWidth-shiftBits-2):0], {shiftBits{1'b0}}};
endmodule
