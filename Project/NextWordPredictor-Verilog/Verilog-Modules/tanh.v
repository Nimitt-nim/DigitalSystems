module tanh(
    input [31:0]x,
    output [31:0]y
);
    wire [31:0] s;
    wire [31:0] x_into_2;
    wire [31:0] s_other;
    wire[31:0] s_into_2;
    wire [31:0] s_other;
    wire [31:0] x_other;
    // Constants
	  wire [31:0] two;
    wire [31:0] one;
    
    assign two = 32'b01000000000000000000000000000000;
    assign one = 32'b00111111100000000000000000000000;
    assign x_other=x;
    Addition_Subtraction a1(.a_operand(x), .b_operand(x_other), .AddBar_Sub(0), .Exception(), .result(x_into_2));

    sigmoid s1(.x(x_into_2), .y(s));
    
    assign s_other = s;
		
    // multiplier_fp m2(.a_operand(s), .b_operand(two), .Exception(),.Overflow(),.Underflow(), .result(s_into_2));
    Addition_Subtraction a2(.a_operand(s), .b_operand(s_other), .AddBar_Sub(0), .Exception(), .result(s_into_2));
    Addition_Subtraction a3(.a_operand(s_into_2), .b_operand(one), .AddBar_Sub(1), .Exception(), .result(y));

endmodule