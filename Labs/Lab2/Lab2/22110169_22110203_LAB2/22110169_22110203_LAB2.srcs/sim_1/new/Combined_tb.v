`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2024 09:55:00 AM
// Design Name: 
// Module Name: Combined_tb
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


module Combined_tb();
    reg [7:0] A;
    reg [7:0] B;
    reg Mode;
    wire [8:0] OUT;
    Combined uut( A, B, Mode, OUT);
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
    A = 8'b00100001; B = 8'b00000001; Mode = 0;
    #10;
    A = 8'b00000001; B = 8'b00000001; Mode = 1;
    #10;
    A = 8'b10000011; B = 8'b10000001; Mode = 0;
    #10;   
    A = 8'b00100011; B = 8'b01000001; Mode = 1;
    #10;
    
    $finish();
    end
endmodule
