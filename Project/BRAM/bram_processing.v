`timescale 1ns/10ps
module BRAM_processing(
input clk,
input [3:0]counter1,
input ena,
input wea,
input e,
input [7:0]dina,
output reg [7:0]mem_out
);
wire [7:0] m1;
blk_mem_gen_0 your_instance_name (
.clka(clk),
.ena(ena),
.wea(wea),
.addra(counter1),
.dina(dina),
.douta(m1)
);
always @(*) begin
if (e) begin
mem_out <= m1 + 1;
end
else
begin
mem_out <= m1;
end
end
endmodule