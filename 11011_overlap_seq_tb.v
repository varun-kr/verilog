// Code your testbench here
// or browse Examples
module seq_tb;
  wire out;
  reg x,clk,rst;
  seq_detector UUT(out,x,clk,rst);
  initial begin clk=0 ; rst=1 ;end
  always #5 clk = ~clk;
  initial
    begin #7 rst=0 ;#5 x= 1;#10 x= 1; #10 x= 0; #10 x= 1;
          #10 x= 1; #10 x= 0; #10 x= 1; #10 x= 1; #10 x= 0;
          #10 x= 1; #10 x= 1; #10 x= 1; #10 x= 1; #10 x= 1;
    end
  initial
    begin
      $monitor($time,"out=%d  %b",out,UUT.x);
      $dumpvars(0,seq_tb);
      $dumpfile("test.vcd");
      #300 $finish;
    end
endmodule