// Code your design here
module div_freq_2 (q,clk,rst);
  input rst,clk;
  output reg q;
  always@(posedge clk)
    if (rst)
      q <= 0;
    else 
      q <= ~q;
endmodule