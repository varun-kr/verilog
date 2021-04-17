// Code your testbench here
// or browse Examples
module test;
  wire out;
  reg x ,clk,rst;
  seq_detector DUT(out,x,clk,rst);
  initial begin clk=0;rst=1;end
  always #5 clk=~clk;
  initial
    begin
      #7 rst=0; #5 x=0 ;#10 x=1 ;#10 x=1 ;#10 x=0 ;
      #10 x=1 ; #10 x=0 ;#10 x=1 ;#10 x=1 ;#10 x=0 ;
      #10 x=1 ;#10 x=1 ;#10 x=1 ;#10 x=1 ;#10 x=1 ;
      #10 x=0 ;#10 x=1 ;#10 x=1 ;#10 x=0 ;#10 x=1 ;
    end
  initial
    begin
      $dumpfile("test.vcd");
      $dumpvars(0,test);
      $monitor($time,"out=%b ",out);
      #500 $finish;
    end
endmodule