// Code your design here
module toggle_ff(q,clk,rst);
  input clk,rst;
  output reg q;
  always@(posedge clk)
    if (rst)
      q <= 0 ;
    else 
      q <= ~q;
endmodule
module div_by_16(clk_out,clk,rst);
  input clk,rst;
  output clk_out;
  wire [3:0] t;
  assign clk_out = t[3];
  toggle_ff f0(t[0],clk,rst);
  toggle_ff f1(t[1],~t[0],rst);
  toggle_ff f2(t[2],~t[1],rst);
  toggle_ff f3(t[3],~t[2],rst);
endmodule
  