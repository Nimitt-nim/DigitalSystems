module SmartMathTutor (
    input [4:0]sel, [4:0]range;
    output reg [31:0]OUT;
);


    
always @(*)
    OUT[0] = 1;
    OUT[1] =  sel[0] & ~sel[1] & ~sel[2] &  ~sel[3];
    OUT[2] = ~sel[0] & sel[1] & ~sel[2] &  ~sel[3];
    OUT[3] = sel[0] & sel[1] & ~sel[2] &  ~sel[3];
    OUT[4] = sel[0] & sel[1] & ~sel[2] &  ~sel[3];
    OUT[5] = sel[0] & sel[1] & ~sel[2] &  ~sel[3];
endmodule