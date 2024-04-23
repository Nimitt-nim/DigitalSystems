`timescale 1ns / 1ps

module vec_mul(A, B, C);
parameter bw=32;
parameter m=4;
wire e;
input [bw*m-1:0]A, B;
output [bw*m-1:0]C;

genvar i;
generate
    for(i=0; i<m; i=i+1)
    begin
    multiplier_fp add(.a_operand(A[i*bw+:bw]), .b_operand(B[i*bw+:bw]),.Exception(),.Overflow(),.Underflow(), .result(C[i*bw+:bw]));
    end
endgenerate
endmodule
