// Code your testbench here
// or browse Examples
module test;
  wire t;
  reg clk,rst;
  div_9 DUT(t,clk,rst);
  initial begin clk = 0; rst=1;#12 rst=0;end
  always #5 clk = ~clk;
  initial
    begin
      $dumpfile("test.vcd");
      $dumpvars(0,test);
      #1000 $finish;
    end
endmodule
  