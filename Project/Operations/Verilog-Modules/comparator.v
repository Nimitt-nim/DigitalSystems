`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2024 19:06:51
// Design Name: 
// Module Name: comparatar
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


module comparator(
    input [31:0] num1,
    input [31:0] num2,
    output reg [1:0] result, // 2-bit result: 00 for equal, 01 for num1 greater, 10 for num2 greater
    
);
  reg sign1;
  reg [7:0] exponent1;
  reg [7:0] exponent2;
  reg [23:0] mantissa1;
  reg sign2;
 
  reg [23:0] mantissa2;

always @(*) begin
    // Extracting sign bit, exponent, and mantissa for number 1
    
    sign1 = num1[31];
    exponent1 = num1[30:23];
    mantissa1 = num1[22:0];
    mantissa1[23] = 1;

    // Extracting sign bit, exponent, and mantissa for number 2
    
    sign2 = num2[31];
    exponent2 = num2[30:23];
    mantissa2 = num2[22:0];
    mantissa2[23] = 1;

    // Compare sign bits
    if (sign1 != sign2) begin
        if (sign1 == 0)
            result = 2'b01; // num1 is greater
        else
            result = 2'b10; // num2 is greater
    end else begin
        // Comparing exponents
        if (exponent1 != exponent2) begin
            // Align mantissas based on exponents
            if (exponent1 > exponent2) begin
             
                    mantissa2 = mantissa2 >> (exponent1-exponent2) ;
               
            end else begin
                    mantissa1 = mantissa1 >> (exponent2-exponent1) ;
         
            end
        end
        // Comparing mantissas
        if (sign1 == 0)begin
	        if (mantissa1 > mantissa2)
	            result = 2'b01; // num1 is greater
	        else if (mantissa1 < mantissa2)
	            result = 2'b10; // num2 is greater
	        else
	            result = 2'b00; // numbers are equal
          end
        else begin
		      if (mantissa1 > mantissa2)
	            result = 2'b10; // num2 is greater
	        else if (mantissa1 < mantissa2)
	            result = 2'b01; // num1 is greater
	        else
	            result = 2'b00; // numbers are equal
          end
            
    end
end

endmodule

