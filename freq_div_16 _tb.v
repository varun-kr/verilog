// Code your testbench here
// or browse Examples
module test;
  wire clk_out;
  reg clk,rst;
  initial begin clk =0 ; rst=1 ; #7 rst=0 ; end
  always #5 clk = ~clk;
  div_by_16 DUT(clk_out,clk,rst);
  initial
    begin
      $dumpfile("test.vcd");
      $dumpvars(0,test);
      #1000 $finish;
    end
endmodule