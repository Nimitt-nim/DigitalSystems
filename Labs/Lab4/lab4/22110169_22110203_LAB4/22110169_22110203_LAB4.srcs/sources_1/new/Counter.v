`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 07:08:44
// Design Name: 
// Module Name: Counter
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


module Counter(
    input clk,
    input reset,
    output [3:0] count,
    input up_down,
    input bin_bcd,
    input preset
    );
    


     and(cond1,count[3],~count[0], ~count[2],count[1], bin_bcd);  
     or(cond2,cond1,reset);                                                          
     and(cond10, preset, bin_bcd); 
     or(cond11, cond2, cond10); 
    

        
    
     and(cond4,count[3],count[1],count[0],count[2], bin_bcd);
     or(cond6, cond4, preset);
     and(cond9, preset, ~bin_bcd);
     or(cond7, cond4, cond11);
    
    
    tff a1(.t(1),.clk(clk),.reset(cond2), .preset(cond6), .q(count[0]));
    
    
    and(g1,~up_down,count[0]); //  Up Counter
    and(g2,up_down,~count[0]); // Down Counter
    or(f1,g1,g2);
    
    
    tff a2(.t(f1),.clk(clk),.reset(cond7),.preset(cond9), .q(count[1]));
    
   
    and(h1,g1,count[1]);              
    and(h2,g2,~count[1]);
    or(f2,h1,h2);
   
    
    tff a3(.t(f2),.clk(clk),.reset(cond7), .preset(cond9), .q(count[2]));
    
       
    and(i1,h1,count[2]);
    and(i2,h2,~count[2]);
    or(f3,i1,i2);
    
    
    tff a4(.t(f3),.clk(clk),.reset(cond2),. preset(cond6), .q(count[3]));

endmodule
