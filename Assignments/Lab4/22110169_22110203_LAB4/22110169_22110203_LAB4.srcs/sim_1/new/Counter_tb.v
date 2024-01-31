`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 07:20:07
// Design Name: 
// Module Name: Counter_tb
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


module Counter_tb();

    reg clk;
    reg reset;
    wire [3:0] count;
    reg up_down;
    reg bin_bcd;
    reg preset;
    Counter uut( clk,reset,count, up_down, bin_bcd, preset);
    
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end
    
    initial begin
    
    // Test Case 1
//    reset = 1; up_down = 0; bin_bcd = 0; preset = 0;
//    #10;    
//    reset = 0; up_down = 0; bin_bcd = 0; preset = 0;
//    #10; 
    
    // Test Case 2
//    reset = 1; up_down = 0; bin_bcd = 1; preset = 0;
//    #10;    
//    reset = 0; up_down = 0; bin_bcd = 1; preset = 0;
//    #10; 
    
    // Test Case 3
//    reset = 0; up_down = 1; bin_bcd = 0; preset = 1;
//    #10;    
//    reset = 0; up_down = 1; bin_bcd = 0; preset = 0;
//    #10; 
    
    // Test Case 4
    reset = 0; up_down = 1; bin_bcd = 1; preset = 1;
    #10;    
    reset = 0; up_down = 1; bin_bcd = 1; preset = 0;
    #10; 
    end
    
endmodule
