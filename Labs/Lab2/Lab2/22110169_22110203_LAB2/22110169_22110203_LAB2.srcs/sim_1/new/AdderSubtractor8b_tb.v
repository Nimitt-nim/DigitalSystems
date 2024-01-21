`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2024 10:12:41 AM
// Design Name: 
// Module Name: AdderSubtractor8b_tb
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


module AdderSubtractor8b_tb();
    reg [7:0] A;
    reg [7:0] B;
    reg Mode;
    wire [7:0] OUT;
    wire Cout;
    AdderSubtractor8b uut(A, B, Mode, OUT, Cout);
    initial
    begin
    A = 8'b00000001; B = 8'b00000001; Mode = 0;
    #10;
    A = 8'b00000001; B = 8'b00000001; Mode = 1;
    #10;
    A = 8'b00000011; B = 8'b00000001; Mode = 0;
    #10;    
    A = 8'b00000011; B = 8'b00000001; Mode = 1;
    #10;
    A = 8'b00000011; B = 8'b10000001; Mode = 1;
    #10;
    $finish();
    end
endmodule
