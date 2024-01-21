`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2024 10:07:19 AM
// Design Name: 
// Module Name: GreyConverter_tb
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


module GreyConverter_tb();
    reg [8:0] A;
    wire [8:0] OUT;
    GrayConverter uut(A, OUT);
    initial
    begin
    A = 9'b000000001; 
    #10;
    A = 9'b000000010; 
    #10;
    A = 9'b000000011; 
    #10;
    A = 9'b100000001; 
    #10;
    A = 9'b000000010; 
    #10;
    A = 9'b010000011; 
    #10;
    A = 9'b000010001; 
    #10;
    A = 9'b000000010; 
    #10;
    A = 9'b000001011; 
    #10;
    $finish();
    end
endmodule
