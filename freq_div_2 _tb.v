// Code your testbench here
// or browse Examples
module tb;
  wire q;
  reg rst,clk;
  div_freq_2 DUT(q,clk,rst);
  initial begin clk  = 0 ; rst=1 ;#7 rst = 0  ; end
  always #5 clk = ~clk;
  initial
    begin
      $dumpfile("test.vcd");
      $dumpvars(0,tb);
      #300 $finish;
    end
endmodule