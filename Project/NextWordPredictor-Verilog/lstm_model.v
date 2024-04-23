`timescale 1ns / 1ps

module lstm_model(clk, ena, wea, dina, word, pred, predicted_char);

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

parameter num_params=6002;
parameter seq_length=4;
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

input clk, ena, wea;
input [bw-1:0]dina;
input [bw*enc*seq_length-1:0]word;
output [bw*enc-1:0]pred;
output [5:0]predicted_char;
wire [bw*wfm*wfn-1:0]wf;
wire [bw*bfm-1:0]bf;
wire [bw*wim*win-1:0]wi;
wire [bw*bim-1:0]bi;
wire [bw*wcm*wcn-1:0]wc;
wire [bw*bcm-1:0]bc;
wire [bw*wom*won-1:0]wo;
wire [bw*bom-1:0]bo;
wire [bw*wym*wyn-1:0]wy;
wire [bw*bym-1:0]by;
wire [bw*num_params - 1:0]params_flattened;



load_params loading(.clk(clk), .ena(ena), .wea(wea), .dina(dina), .params_flattened(params_flattened), .mem_out());

genvar i;
for(i=0; i<wfm*wfn; i=i+1)
    begin
    assign wf[i*bw+:bw] = params_flattened[i*bw+:bw];
    end
for(i=0; i<bfm; i=i+1)
    begin
    assign bf[i*bw+:bw] = params_flattened[wfm*wfn + i*bw+:bw];
    end
for(i=0; i<wim*win; i=i+1)
    begin
    assign wi[i*bw+:bw] = params_flattened[wfm*wfn + bfm + i*bw+:bw];
    end
for(i=0; i<bim; i=i+1)
    begin
    assign bi[i*bw+:bw] = params_flattened[wfm*wfn + bfm + wim*win + i*bw+:bw];
    end
for(i=0; i<wcm*wcn; i=i+1)
    begin
    assign wc[i*bw+:bw] = params_flattened[wfm*wfn + bfm + wim*win + bim + i*bw+:bw];
    end
for(i=0; i<bcm; i=i+1)
    begin
    assign bc[i*bw+:bw] = params_flattened[wfm*wfn + bfm + wim*win + bim + wcm*wcn + i*bw+:bw];
    end    
for(i=0; i<wom*won; i=i+1)
    begin
    assign wo[i*bw+:bw] = params_flattened[wfm*wfn + bfm + wim*win + bim + wcm*wcn + bcm + i*bw+:bw];
    end
for(i=0; i<bom; i=i+1)
    begin
    assign bo[i*bw+:bw] = params_flattened[wfm*wfn + bfm + wim*win + bim + wcm*wcn + bcm + wom*won + i*bw+:bw];
    end    
for(i=0; i<wym*wyn; i=i+1)
    begin
    assign wy[i*bw+:bw] = params_flattened[wfm*wfn + bfm + wim*win + bim + wcm*wcn + bcm + wom*won + bom + i*bw+:bw];
    end
for(i=0; i<bym; i=i+1)
    begin
    assign by[i*bw+:bw] = params_flattened[wfm*wfn + bfm + wim*win + bim + wcm*wcn + bcm + wom*won + bom + wym*wyn + i*bw+:bw];
    end 

top_forward_pass forward_pass(.word(word), .wf(wf), .bf(bf), .wi(wi), .bi(bi), .wc(wc), .bc(bc), .wo(wo), .bo(bo),.wy(wy), .by(by), .pred(pred), .predicted_char(predicted_char));

endmodule
