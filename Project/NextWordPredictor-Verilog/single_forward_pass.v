`timescale 1ns / 1ps

module forward_pass(char, cell_state, hidden_state, wf, bf, wi, bi, wc, bc, wo, bo,wy, by, hidden_state_updated ,cell_state_updated, pred);

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

parameter enc=27;
parameter hidden_size=25;
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

input [bw*enc-1:0]char;
input [bw*(hidden_size)-1:0]cell_state;
input [bw*(hidden_size)-1:0]hidden_state;
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
output [bw*hidden_size-1:0]cell_state_updated;
output [bw*hidden_size-1:0]hidden_state_updated;

wire [bw*(25+enc)-1:0]X={hidden_state, char};
wire [bw*wfm-1:0]Cf1;
wire [bw*wcm-1:0]Cc1;
wire [bw*wim-1:0]Ci1;
wire [bw*wom-1:0]Co1;
wire [bw*bfm-1:0]Cf;
wire [bw*bcm-1:0]Cc;
wire [bw*bim-1:0]Ci;
wire [bw*bom-1:0]Co;
wire [bw*hidden_size-1:0]cell_state_updated_mid;
wire [bw*hidden_size-1:0]hidden_state_updated_mid;
wire [bw*bym-1:0]out_mid;

fp_matmul #(.bw(bw), .m(wfm), .n(wfn)) matmul1(.A(wf), .B(X), .C(Cf1));
fp_matmul #(.bw(bw), .m(wcm), .n(wcn)) matmul2(.A(wc), .B(X), .C(Cc1));
fp_matmul #(.bw(bw), .m(wim), .n(win)) matmul3(.A(wi), .B(X), .C(Ci1));
fp_matmul #(.bw(bw), .m(wom), .n(won)) matmul4(.A(wo), .B(X), .C(Co1));

vec_adder #(.bw(bw), .m(bfm))  matadd1(.A(Cf1), .B(bf), .C(Cf));
vec_adder #(.bw(bw), .m(bcm))  matadd2(.A(Cc1), .B(bc), .C(Cc));
vec_adder #(.bw(bw), .m(bim))  matadd3(.A(Ci1), .B(bi), .C(Ci));
vec_adder #(.bw(bw), .m(bom))  matadd4(.A(Co1), .B(bo), .C(Co));

wire [bw*bfm-1:0]forget_gate;
wire [bw*bcm-1:0]input_gate;
wire [bw*bim-1:0]candidate_gate;
wire [bw*bom-1:0]output_gate;

genvar i;   

generate
    for(i=0; i<bfm; i=i+1)
    begin
    sigmoid sigf(.x(Cf[i*bw+:bw]), .y(forget_gate[i*bw+:bw]));
    end
endgenerate

generate
    for(i=0; i<bfm; i=i+1)
    begin
    sigmoid sigi(.x(Ci[i*bw+:bw]), .y(input_gate[i*bw+:bw]));
    end
endgenerate

generate
    for(i=0; i<bfm; i=i+1)
    begin
    tanh tanhc(.x(Cc[i*bw+:bw]), .y(candidate_gate[i*bw+:bw]));
    end
endgenerate
generate
    for(i=0; i<bfm; i=i+1)
    begin
    sigmoid sigo(.x(Co[i*bw+:bw]), .y(output_gate[i*bw+:bw]));
    end
endgenerate

wire [bw*bfm-1:0]a1;
wire [bw*bcm-1:0]a2;
vec_mul #(.bw(bw), .m(bfm)) fcell(.A(forget_gate),.B(cell_state),.C(a1));
vec_mul #(.bw(bw), .m(bim)) icand(.A(input_gate),.B(candidate_gate),.C(a2));

vec_adder #(.bw(bw), .m(bfm)) adding(.A(a1),.B(a2),.C(cell_state_updated));

generate
    for(i=0; i<hidden_size; i=i+1)
    begin
    tanh tanning(.x(cell_state_updated[i*bw+:bw]), .y(cell_state_updated_mid[i*bw+:bw]));
    end
endgenerate

vec_mul #(.bw(bw), .m(bom)) mult(.A(output_gate), .B(cell_state_updated_mid), .C(hidden_state_updated));

fp_matmul #(.bw(bw), .m(wym), .n(wyn)) matmul_final(.A(wy), .B(hidden_state_updated), .C(out_mid));
vec_adder #(.bw(bw), .m(bym)) matadd_final(.A(by), .B(out_mid), .C(pred));

endmodule
