`timescale 1ns / 1ps

module load_params(clk, ena, wea, dina, params_flattened, mem_out);
parameter num_params = 6002;
input clk, ena, wea;
input [31:0]dina;
output [32*num_params - 1:0]params_flattened;
output [31:0]mem_out;
reg [31:0]params[num_params-1:0];
reg [12:0]counter=0;

blk_mem_gen_0  bram_read(
.clka(clk),
.ena(ena),
.wea(wea),
.addra(counter),
.dina(dina),
.douta(mem_out)
);

always@(posedge clk)
begin
    params[counter-2]<=mem_out;
    counter<=counter+1;
end

genvar i;
    for(i=0; i<num_params; i=i+1)
    begin
    assign params_flattened[i*32+:32] = params[i];
    end
endmodule
