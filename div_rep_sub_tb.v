// Code your testbench here
// or browse Examples
module DIV_test;
reg [15:0] data_in;
reg clk, start;
wire stop;
div_datapath DP(pgtn,loadn,loads,loadp,clear,inc,data_in, clk);
div_ctrlpath CNTRL(loadn, loadp, loads,clear, inc, stop, clk, pgtn, start);
initial
begin
clk = 1'b0;
#3 start = 1'b1;
#10000 $finish;
end
always #5 clk = ~clk;
initial
begin
#17 data_in = 9832;
#10 data_in = 23;
end
initial
begin
  $monitor ($time," quotient =%d remainder= %d",DP.q,DP.nw);
  $display("quotient is %d and remainder is %d",DP.q,DP.nw);
  $dumpfile ("div.vcd"); $dumpvars (0, DIV_test);
end
endmodule  
