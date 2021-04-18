// Code your testbench here
// or browse Examples
module test_bench;
  wire Q;
  reg clk,rst;
  freq_div_4 DUT(Q,rst,clk);
  initial begin clk = 0 ;rst =1 ;#7 rst =0; end
  always #5 clk = ~clk ;
  initial
    begin
      $dumpfile("test.vcd");
      $dumpvars(0,test_bench);
      #300 $finish;
    end
endmodule