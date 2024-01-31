`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 10:40:19
// Design Name: 
// Module Name: top
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


module top(
    input S,
    input [2:0] Shift,
    input Clk,
    input reset,
    input preset,
    input up_down,
    input bin_bcd,
    output [3:0] OUT
    );
    wire [3:0] out;
    Counter c(.clk(Clk), .reset(reset), .count(out), .up_down(up_down), .bin_bcd(bin_bcd),.preset(preset));
    ShiftRegister sr(.D(out), .S(S), .Shift(Shift), .Clk(Clk), .Q(OUT));
endmodule
