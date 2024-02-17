`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 07:45:11
// Design Name: 
// Module Name: tff_tb
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


module tff_tb();
    reg t, reset, clk, preset;
    wire q;
    tff uut(clk, reset,t, preset, q);
    initial 
    begin
    clk = 0;
        forever #5 clk = ~clk;
    end
    initial
    begin
    t = 1; reset = 0; preset = 1; 
    #10;
        t = 1; reset = 1; preset = 0; 
    #10;
        t = 1; reset = 0; preset = 0; 
    #10;

    $finish();
    end
endmodule
