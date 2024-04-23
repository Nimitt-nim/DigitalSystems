`timescale 1ns / 1ps

module sigmoid(
    input [31:0]x,
    output [31:0] y
);  
    // Constants
    wire [31:0] zero;
    assign zero = 32'b00000000000000000000000000000000;
    
    wire [31:0] one;
    assign one = 32'b00111111100000000000000000000000;
    
    wire [31:0] minus_five;
    assign minus_five = 32'b11000000101000000000000000000000;
    
    wire [31:0] minus_two;
    assign minus_two = 32'b11000000000000000000000000000000;
    
    wire [31:0] two;
    assign two = 32'b01000000000000000000000000000000;
    
    wire [31:0] five;
    assign five = 32'b01000000101000000000000000000000;
    
    wire [31:0] zero_point_0375;
    assign zero_point_0375 = 32'b00111101000110011001100110011010;
    
    wire [31:0] zero_point_5;
    assign zero_point_5 = 32'b00111111000000000000000000000000;
    
    wire [31:0] zero_point_805;
    assign zero_point_805 = 32'b00111111010011100001010001111011;
    
    wire [31:0] zero_point_190;
    assign zero_point_190 = 32'b00111110010000101000111101011100;
    
    wire [1:0] c1, c2, c3, c4;
    
    comparator co1(.num1(x),.num2(minus_five), .result(c1));
    comparator co2(.num1(x),.num2(minus_two), .result(c2));
    comparator co3(.num1(x),.num2(two), .result(c3));
    comparator co4(.num1(x),.num2(five), .result(c4));
    
    wire [31:0] o1;
    wire [31:0] o2;
    wire [31:0] o3;
    
    wire [31:0] u1;
    wire [31:0] u2;
    wire [31:0] u3;
   
    multiplier_fp m1(.a_operand(x), .b_operand(zero_point_0375), .Exception(),.Overflow(),.Underflow(), .result(o1));
    multiplier_fp m2(.a_operand(x), .b_operand(zero_point_190), .Exception(),.Overflow(),.Underflow(), .result(o2));
    multiplier_fp m3(.a_operand(x), .b_operand(zero_point_0375), .Exception(),.Overflow(),.Underflow(), .result(o3));

    Addition_Subtraction a1(.a_operand(o1), .b_operand(zero_point_190), .AddBar_Sub(0), .Exception(), .result(u1));
    Addition_Subtraction a2(.a_operand(o2), .b_operand(zero_point_5), .AddBar_Sub(0),.Exception(), .result(u2));
    Addition_Subtraction a3(.a_operand(o3), .b_operand(zero_point_805), .AddBar_Sub(0),.Exception(), .result(u3));
    
 
assign y = (c1==2)?zero:((c2==2)?u1:((c3==2)?u2:((c4==2)?u3:one)));

    
endmodule