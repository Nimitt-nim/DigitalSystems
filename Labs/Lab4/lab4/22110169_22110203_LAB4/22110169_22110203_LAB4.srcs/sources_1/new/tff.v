`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 07:12:01
// Design Name: 
// Module Name: tff
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


module tff(
    input clk,
    input reset,
    input t,
    input preset,
    output reg q
    );
    always @ (posedge clk, posedge reset, posedge preset) begin  
        if (reset)  
          q <= 0;  
        else if (preset)
          q <= 1;
        else  
            begin
            if (t == 1)  
                q <= ~q;  
            else  
                q <= q; 
            end
      end 
endmodule
