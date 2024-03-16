`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2024 01:19:26 PM
// Design Name: 
// Module Name: array_multiplier
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


module array_multiplier(
    input [3:0] A,
    input [3:0] B,
    output reg [7:0] OUT 
);

    reg [7:0] temp;
    parameter n = 4;
    parameter l = 8;
    integer i = 0;
    integer j = 0;

    always @(*)
        begin
        OUT = 8'b0;
        for (i = 0; i < n; i=i+1)         
            for (j = 0; j < i+1; j=j+1)
                begin
                temp = 8'b0;
                temp[i] = (A[i-j] & B[j]);
                OUT = OUT + temp;
                end

        for (i = n; i < l; i=i+1)
            for (j = n - 1; j > i-n; j=j-1)
            begin
                temp = 0;
                temp[i] = (A[i-j] & B[j]);
                OUT = OUT + temp;
            end
        end
endmodule
