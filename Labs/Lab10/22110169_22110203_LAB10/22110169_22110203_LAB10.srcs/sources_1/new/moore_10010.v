`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 04:04:59 PM
// Design Name: 
// Module Name: moore_10010
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

module moore_10010 (main_clk, w, reset, z, slow_clk);
    input main_clk, w, reset; 
    output z; 
    output slow_clk;
    reg y, Y; 
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;

    wire slow_clk;
    clock_divider inst(.clk(main_clk), .rst(reset),.slow_clk(slow_clk));


    always @(w or y)
        begin
            case (y)
            A: if (w == 0)
            begin
            Y = A;
            end
            else
            begin
            Y = B;
            end

            B: if (w == 0)
            begin
            Y = C;
            end
            else
            begin
            Y = B;
            end

            C: if (w == 0)
            begin
            Y = D;
            end
            else
            begin
            Y = B;
            end

            D: if (w == 0)
            begin
            Y = A;
            end
            else
            begin
            Y = E;
            end

            E: if (w == 0)
            begin
            Y = F; 
            end
            else
            begin
            Y = B;
            end

            F: if (w == 0)
            begin
            Y = D; 
            end
            else
            begin
            Y = B;
            end
            endcase

        end

    always @(negedge slow_clk or negedge reset)
        begin
            if (reset == 0)
            begin
            y <= A; 
            end
            else
            begin
            y <= Y;
            end
        end

    assign z = (y == F);
    
endmodule

