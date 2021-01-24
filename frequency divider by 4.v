module ripple(clk,count);
input clk;
output [1:0] count  ;
  tff f1 (~clk,count[0]);
  tff f2 (~count[0],count[1]);
endmodule
module tff(clk,t);
input clk;
output reg t=0;
always@(posedge clk)
 t = ~t;
endmodule