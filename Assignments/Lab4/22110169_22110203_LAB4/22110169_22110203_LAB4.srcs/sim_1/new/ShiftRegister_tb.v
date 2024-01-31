`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 10:22:54
// Design Name: 
// Module Name: ShiftRegister_tb
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


module ShiftRegister_tb();
    reg [3:0] D;
    reg S;
    reg [1:0] Shift;
    reg Clk;
    wire [3:0] Q;

    ShiftRegister uut(D, S, Shift, Clk, Q);

    initial 
    begin 
        Clk = 1;
        forever #5 Clk = ~Clk;
    end

    initial
    begin
    D = 4'b0000; Shift = 2'b00;  S = 0;
    #10;
    D = 4'b0000; Shift = 2'b01;  S = 1;
    #10;
    D = 4'b0000; Shift = 2'b01;  S = 1;
    #10;
    D = 4'b0000; Shift = 2'b01;  S = 1;
    #10;
    D = 4'b0000; Shift = 2'b01;  S = 1;
    #10;
    D = 4'b0000; Shift = 2'b10;  S = 0;
    #10;
    D = 4'b0000; Shift = 2'b10;  S = 0;
    #10;
    D = 4'b0000; Shift = 2'b10;  S = 0;
    #10;
    D = 4'b0000; Shift = 2'b10;  S = 0;
    #10;
    D = 4'b1111; Shift = 2'b00;  S = 0;
    #10;
    $finish();
    end
endmodule
