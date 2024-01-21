`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2024 09:18:01 AM
// Design Name: 
// Module Name: GrayConverter
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


module GrayConverter(
    input [9:0] A,
    output [9:0] OUT
    );
    assign OUT[8] = A[8];
    xor a1(OUT[7], A[8], A[7]);
    xor a2(OUT[6], A[7], A[6]);
    xor a3(OUT[5], A[6], A[5]);
    xor a4(OUT[4], A[5], A[4]);
    xor a5(OUT[3], A[4], A[3]);
    xor a6(OUT[2], A[3], A[2]);
    xor a7(OUT[1], A[2], A[1]);
    xor a8(OUT[0], A[1], A[0]);
endmodule
