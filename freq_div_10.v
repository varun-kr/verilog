// Code your design here
module dff(Q,d,rst,clk);
  input d,rst,clk;
  output reg Q;
  always@(posedge clk)
    if (rst)
      Q <= 0;
     else
       Q <= d;
endmodule
module freq_div_10(Q,rst,clk);
  input clk,rst;
  output Q;
  wire [3:0] t;
  assign Q = t[3];
  dff f0(t[0],(~t[2])&(~t[0]),rst,clk);
  dff f1(t[1],(~t[2]&~t[1]&t[0])|(~t[2]&t[1]&~t[0]),rst,clk);
  dff f2(t[2],(~t[2]&t[1]&t[0]),rst,clk);
  dff f3(t[3],(t[3]&~t[2])|(~t[3]&t[2]&~t[1]&~t[0]),rst,clk);
endmodule 