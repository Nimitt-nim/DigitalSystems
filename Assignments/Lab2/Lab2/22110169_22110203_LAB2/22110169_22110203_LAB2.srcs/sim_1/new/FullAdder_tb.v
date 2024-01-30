`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2024 10:18:59 AM
// Design Name: 
// Module Name: FullAdder_tb
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


module FullAdder_tb();
    reg A, B, Cin;
    wire Sum, Cout;
    FullAdder uut(A, B, Cin, Sum, Cout);
    initial begin
    A = 0; B = 0; Cin = 0;
    #10;
    A = 1; B = 0; Cin = 0;
    #10;
    A = 1; B = 0; Cin = 1;
    #10;
    A = 0; B = 0; Cin = 1;
    #10;
    A = 1; B = 0; Cin = 0;
    #10;
    A = 1; B = 1; Cin = 1;
    #10;
    
    $finish();
    end
endmodule
