`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 07:00:11
// Design Name: 
// Module Name: ShiftRegister
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


module ShiftRegister(
    input [3:0] D,
    input S,
    input [1:0] Shift,
    input Clk,
    output reg [3:0] Q
    );
    always @(posedge Shift,negedge Shift, posedge Clk)
    begin
        if (~Shift[1] & ~Shift[0])            // Parallel Input
            Q <= D;
        else if (~Shift[1] & Shift[0])    
            begin                               // Left Shift Register
                Q[3] <= Q[2];
                Q[2] <= Q[1];
                Q[1] <= Q[0];
                Q[0] <= S;
            end
        else if (Shift[1] & ~Shift[0]) 
            begin    
                Q[0] <= Q[1];
                Q[1] <= Q[2];
                Q[2] <= Q[3];
                Q[3] <= S;                            // RightShift Register;
            end
        else                                  // No Shift
            Q <= Q;
    end
endmodule
