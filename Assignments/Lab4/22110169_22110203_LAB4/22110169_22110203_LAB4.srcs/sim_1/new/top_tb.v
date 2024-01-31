`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 12:12:07
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    reg S;
    reg [2:0] Shift;
    reg Clk;
    reg reset;
    reg preset;
    reg up_down;
    reg bin_bcd;
    wire [3:0] OUT;
    
    top uut(S, Shift, Clk, reset, preset, up_down, bin_bcd, OUT);
    initial
    begin
        Clk = 0;
        forever #10 Clk = ~Clk;
    end
    
    initial 
    begin
//        // Test Case 1 Binary Up
//        S = 1; Shift = 0; reset = 1; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // shifting left
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // shift right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading 
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // shifting left
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // shifting left
//        #10;
//        S = 1; Shift = 0; reset = 1; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // shifting left
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading 
//        #10;
//        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // shifting right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // shifting left
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading 
//        #10;
//        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // shifting right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading 
//        #10;
//        S = 0; Shift = 2; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // shifting right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // No shift
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0;  // loading
//        #10;
//        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 0; bin_bcd = 0;  // No shift
//        #10;
//        S = 0; Shift = 0; reset = 1; preset = 0; up_down = 0; bin_bcd = 0; // starting clock again
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // starting clock again
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // No shift
//        #10;
//        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // No Shift
//        #10;
//        S = 0; Shift = 3; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // No shift
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; // loading
//        #10;
        
        // Test Case 2 BCD Up
//        S = 1; Shift = 0; reset = 1; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // shifting left
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // shift right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading 
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // shifting left
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // shifting left
//        #10;
//        S = 1; Shift = 0; reset = 1; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // shifting left
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading 
//        #10;
//        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // shifting right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // shifting left
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading 
//        #10;
//        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // shifting right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading 
//        #10;
//        S = 0; Shift = 2; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // shifting right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // No shift
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1;  // loading
//        #10;
//        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 0; bin_bcd = 1;  // No shift
//        #10;
//        S = 0; Shift = 0; reset = 1; preset = 0; up_down = 0; bin_bcd = 1; // starting clock again
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // starting clock again
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // No shift
//        #10;
//        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // No Shift
//        #10;
//        S = 0; Shift = 3; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // No shift
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 1; // loading
//        #10;

        // Test Case 3 Binary Down
//        S = 1; Shift = 0; reset = 0; preset = 1; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // shifting left
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // shift right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading 
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // shifting left
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // shifting left
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 1; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // shifting left
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading 
//        #10;
//        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // shifting right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // shifting left
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading 
//        #10;
//        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // shifting right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading 
//        #10;
//        S = 0; Shift = 2; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // shifting right
//        #10;
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // No shift
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0;  // loading
//        #10;
//        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 1; bin_bcd = 0;  // No shift
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 1; up_down = 1; bin_bcd = 0; // starting clock again
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // starting clock again
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // No shift
//        #10;
//        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // No Shift
//        #10;
//        S = 0; Shift = 3; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // No shift
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;
//        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 0; // loading
//        #10;

    // Test Case 4 BCD Down
 
        S = 1; Shift = 0; reset = 0; preset = 1; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // shifting left
        #10;
        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // shift right
        #10;
        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading 
        #10;
        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // shifting left
        #10;
        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // shifting left
        #10;
        S = 1; Shift = 0; reset = 0; preset = 1; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // shifting left
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading 
        #10;
        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // shifting right
        #10;
        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // shifting left
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading 
        #10;
        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // shifting right
        #10;
        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading 
        #10;
        S = 0; Shift = 2; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // shifting right
        #10;
        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // No shift
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1;  // loading
        #10;
        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 1; bin_bcd = 1;  // No shift
        #10;
        S = 0; Shift = 0; reset = 0; preset = 1; up_down = 1; bin_bcd = 1; // starting clock again
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // starting clock again
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // No shift
        #10;
        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // No Shift
        #10;
        S = 0; Shift = 3; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // No shift
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        S = 0; Shift = 0; reset = 0; preset = 0; up_down = 1; bin_bcd = 1; // loading
        #10;
        
        
        
        // Shifting 
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; 
//        #10;
//        S = 1; Shift = 1; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; 
//        #10;
//        S = 1; Shift = 3; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; 
//        #10;
//        S = 1; Shift = 2; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; 
//        #10;
        
        
//        // Loading Again
//        S = 1; Shift = 0; reset = 0; preset = 0; up_down = 0; bin_bcd = 0; 
//        #10;
        
    $finish();    
    end
endmodule
