`timescale 1ns / 1ps

module vec_adder(A, B, C);
parameter bw=32;
parameter m=4;
wire e;
input [bw*m-1:0]A, B;
output [bw*m-1:0]C;

genvar i;
generate
    for(i=0; i<m; i=i+1)
    begin
    Addition_Subtraction add(.a_operand(A[i*bw+:bw]), .b_operand(B[i*bw+:bw]), .AddBar_Sub(0), .Exception(e), .result(C[i*bw+:bw]));
    end
endgenerate
endmodule
