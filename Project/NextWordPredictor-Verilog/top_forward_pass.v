`timescale 1ns / 1ps

module top_forward_pass(word, wf, bf, wi, bi, wc, bc, wo, bo,wy, by, pred, predicted_char);

//parameter seq_length=4;
//parameter enc=51;
//parameter bw=32;
//parameter wfm=50, wfn=101;
//parameter bfm = 50;
//parameter wim=50, win=101;
//parameter bim = 50;
//parameter wcm=50, wcn=101;
//parameter bcm = 50;
//parameter wom=50, won=101;
//parameter bom = 50;
//parameter wym=51, wyn=101;
//parameter bym = 51;

parameter seq_length=4;
parameter hidden_size = 25;
parameter enc=27;
parameter bw=32;
parameter wfm=25, wfn=52;
parameter bfm = 25;
parameter wim=25, win=52;
parameter bim =25 ;
parameter wcm=25, wcn=52;
parameter bcm = 25;
parameter wom=25, won=52;
parameter bom = 25;
parameter wym=27, wyn=25;
parameter bym = 27;

input [bw*enc*seq_length-1:0]word;
input [bw*wfm*wfn-1:0]wf;
input [bw*bfm-1:0]bf;
input [bw*wim*win-1:0]wi;
input [bw*bim-1:0]bi;
input [bw*wcm*wcn-1:0]wc;
input [bw*bcm-1:0]bc;
input [bw*wom*won-1:0]wo;
input [bw*bom-1:0]bo;
input [bw*wym*wyn-1:0]wy;
input [bw*bym-1:0]by;
output [bw*enc-1:0]pred;
output [5:0]predicted_char;

wire [bw*hidden_size-1:0] hidden_state_mid[seq_length:0];
wire [bw*hidden_size-1:0] cell_state_mid[seq_length:0];
wire [bw*enc-1:0]pred_mid[seq_length-1:0];
assign hidden_state_mid[0]=0;
assign cell_state_mid[0]=0;

genvar i;
generate
    for(i=0; i<seq_length; i=i+1)
    begin
    forward_pass fp(.char(word[i*bw*enc+:bw*enc]), .cell_state(cell_state_mid[i]), .hidden_state(hidden_state_mid[i]), .wf(wf), .bf(bf), .wi(wi), .bi(bi), .wc(wc), .bc(bc), .wo(wo), .bo(bo) ,.wy(wy), .by(by), .hidden_state_updated(hidden_state_mid[i+1]) ,.cell_state_updated(cell_state_mid[i+1]), .pred(pred_mid[i]));
    end
endgenerate
 
assign pred = pred_mid[seq_length-1];

wire [bw-1:0]max;
wire [5:0]max_pos = 0;
wire [1:0]comp_res[enc-2:0];
assign max=pred[bw-1:0];

genvar j;
generate
    for(j=1; j<enc; j=j+1)
    begin
    comparator comparing(.num1(pred[j*bw+:bw]), .num2(max), .result(comp_res[j]), .exponent1(), .exponent2());
    assign max_pos = comp_res[j][0]?j:max_pos;
    end
endgenerate

assign predicted_char = max_pos;
endmodule
