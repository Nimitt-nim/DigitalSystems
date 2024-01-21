`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2024 11:38:49 AM
// Design Name: 
// Module Name: Question2
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


module Question2(
    input [3:0] S,
    input [4:0] R,
    output reg OUT
    );
    
    reg [31:0] Rd;
    reg [9:2] Rm;
    reg [9:1] Sd;
    always @(*)
        begin
        // Decoder
        Rd[0] = (~R[0] & ~R[1] & ~R[2] & ~R[3] & ~R[4]);
        Rd[1] = (R[0] & ~R[1] & ~R[2] & ~R[3] & ~R[4]);
        Rd[2] = (~R[0] & R[1] & ~R[2] & ~R[3] & ~R[4]);
        Rd[3] = (R[0] & R[1] & ~R[2] & ~R[3] & ~R[4]);
        Rd[4] = (~R[0] & ~R[1] & R[2] & ~R[3] & ~R[4]);
        Rd[5] = (R[0] & ~R[1] & R[2] & ~R[3] & ~R[4]);
        Rd[6] = (~R[0] & R[1] & R[2] & ~R[3] & ~R[4]);
        Rd[7] = (R[0] & R[1] & R[2] & ~R[3] & ~R[4]);
        Rd[8] = (~R[0] & ~R[1] & ~R[2] & R[3] & ~R[4]);
        Rd[9] = (R[0] & ~R[1] & ~R[2] & R[3] & ~R[4]);
        Rd[10] = (~R[0] & R[1] & ~R[2] & R[3] & ~R[4]);
        Rd[11] = (R[0] & R[1] & ~R[2] & R[3] & ~R[4]);
        Rd[12] = (~R[0] & ~R[1] & R[2] & R[3] & ~R[4]);
        Rd[13] = (R[0] & ~R[1] & R[2] & R[3] & ~R[4]);
        Rd[14] = (~R[0] & R[1] & R[2] & R[3] & ~R[4]);
        Rd[15] = (R[0] & R[1] & R[2] & R[3] & ~R[4]);
        Rd[16] = (~R[0] & ~R[1] & ~R[2] & ~R[3] & R[4]);
        Rd[17] = (R[0] & ~R[1] & ~R[2] & ~R[3] & R[4]);
        Rd[18] = (~R[0] & R[1] & ~R[2] & ~R[3] & R[4]);
        Rd[19] = (R[0] & R[1] & ~R[2] & ~R[3] & R[4]);
        Rd[20] = (~R[0] & ~R[1] & R[2] & ~R[3] & R[4]);
        Rd[21] = (R[0] & ~R[1] & R[2] & ~R[3] & R[4]);
        Rd[22] = (~R[0] & R[1] & R[2] & ~R[3] & R[4]);
        Rd[23] = (R[0] & R[1] & R[2] & ~R[3] & R[4]);
        Rd[24] = (~R[0] & ~R[1] & ~R[2] & R[3] & R[4]);
        Rd[25] = (R[0] & ~R[1] & ~R[2] & R[3] & R[4]);
        Rd[26] = (~R[0] & R[1] & ~R[2] & R[3] & R[4]);
        Rd[27] = (R[0] & R[1] & ~R[2] & R[3] & R[4]);
        Rd[28] = (~R[0] & ~R[1] & R[2] & R[3] & R[4]);
        Rd[29] = (R[0] & ~R[1] & R[2] & R[3] & R[4]);
        Rd[30] = (~R[0] & R[1] & R[2] & R[3] & R[4]);
        Rd[31] = (R[0] & R[1] & R[2] & R[3] & R[4]);


        Rm[2] = (Rd[0] | Rd[2] | Rd[4] | Rd[6] | Rd[8] | Rd[10] | Rd[12] | Rd[12] | Rd[14] | Rd[16] | Rd[18] | Rd[20] | Rd[22] | Rd[24] | Rd[26] | Rd[28] | Rd[30]);
        Rm[3] = (Rd[0] | Rd[3] | Rd[6] | Rd[9] | Rd[12] | Rd[15] | Rd[18] | Rd[21] | Rd[24] | Rd[27] | Rd[30]);
        Rm[4] = (Rd[0] | Rd[4] | Rd[8] | Rd[12] | Rd[16] | Rd[20] | Rd[24] | Rd[28]);
        Rm[5] = (Rd[0] | Rd[5] | Rd[10] | Rd[15] | Rd[20] | Rd[25] | Rd[30]);
        Rm[6] = (Rd[0] | Rd[6] | Rd[12] | Rd[18] | Rd[24] | Rd[30]);
        Rm[7] = (Rd[0] | Rd[7] | Rd[14] | Rd[21] | Rd[28]);
        Rm[8] = (Rd[0] | Rd[8] | Rd[16] | Rd[24]);
        Rm[9] = (Rd[0] | Rd[9] | Rd[18] | Rd[27]);


        Sd[1] = (S[0] & ~S[1] & ~S[2] & ~S[3]);
        Sd[2] = (~S[0] & S[1] & ~S[2] & ~S[3]);
        Sd[3] = (S[0] & S[1] & ~S[2] & ~S[3]);
        Sd[4] = (~S[0] & ~S[1] & S[2] & ~S[3]);
        Sd[5] = (S[0] & ~S[1] & S[2] & ~S[3]);
        Sd[6] = (~S[0] & S[1] & S[2] & ~S[3]);
        Sd[7] = (S[0] & S[1] & S[2] & ~S[3]);
        Sd[8] = (~S[0] & ~S[1] & ~S[2] & S[3]);
        Sd[9] = (S[0] & ~S[1] & ~S[2] & S[3]);

        // computing the final out

        OUT = ( Sd[1] | (Sd[2] & Rm[2]) | (Sd[3] & Rm[3]) | (Sd[4] & Rm[4]) | (Sd[5] & Rm[5]) | (Sd[6] & Rm[6]) | (Sd[7] & Rm[7]) | (Sd[8] & Rm[8]) | (Sd[9] & Rm[9]));
        end
endmodule
