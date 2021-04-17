module dff(Q,D,rst,clk);
input clk,rst,D;
output reg Q;
always@(posedge clk)
if (rst)
Q <= 0;
else
Q <= D;
endmodule
module freq_div_6(t,rst,clk);
input rst,clk;
output t;
wire [2:0] Q ;
assign t = Q[2];
dff d0(Q[0],(~Q[1])&(~Q[0]),rst,clk);
dff d1(Q[1],(~Q[1])&(Q[0]),rst,clk);
dff d2(Q[2],(Q[2]&~Q[1])|(~Q[2] &Q[1] & (~Q[0])),rst,clk);
endmodule