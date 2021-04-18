// Code your design here
module toggle_ff(q,rst,clk);
  input rst,clk;
  output reg q;
  always@(posedge clk)
    if (rst)
    q <= 0 ;
    else
      q <= ~q;
endmodule
module freq_div_4(Q,rst,clk);
  input clk,rst;
  output Q;
  wire [1:0] t;
  assign Q = t[1];
  toggle_ff f0(t[0],rst,clk);
  toggle_ff f1(t[1],rst,~t[0]);
endmodule
  
  