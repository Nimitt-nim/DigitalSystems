module fp_matmul(A, B, C);
parameter bw=32;//bit width
parameter m=12; //matrix A rows
parameter n=10; //matrix A columns
input [bw*m*n - 1:0] A;
input [bw*n - 1:0] B;
output [bw*m- 1:0] C;     //A High indicates that multiplication is done and result is availble at C.
//assign C=0;
genvar i,j;  //loop indices

wire [bw-1:0]mult_mid[m*n - 1:0];
wire [bw-1:0]add_mid[(n+1)*m - 1:0];  
generate
    for(i=0; i<m; i=i+1)
    begin
        for(j=0; j<n; j=j+1)
        begin
        multiplier_fp mult(.a_operand(A[(i*n+j)*bw+:bw]), .b_operand(B[j*bw+:bw]),.Exception(),.Overflow(),.Underflow(), .result(mult_mid[i*n+j]));
        end
    end
endgenerate

genvar x, y;

generate 
    for(x=0; x<m; x=x+1)
    begin
        assign add_mid[x*(n+1)] = 0;
        for(y=0; y<n; y=y+1)
        begin
        Addition_Subtraction add(.a_operand(add_mid[x*(n+1)+y]),.b_operand(mult_mid[n*x+y]),.AddBar_Sub(0), .Exception(),.result(add_mid[x*(n+1)+y+1]));    
        end
        assign C[x*bw+:bw] = add_mid[(n+1)*(x+1) - 1];
     end
endgenerate

endmodule