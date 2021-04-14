// Code your testbench here
// or browse Examples
module GCD_test;
reg [15:0] data_in;
reg clk, start;
wire done;
reg [15:0] A, B;
gcd DP (lt,gt,eq,lda,ldb,sel1,sel2,sel3,data_in,clk);
controller CON (done,clk,lt,gt,eq,sel1,sel2,sel3,lda,ldb,start);
initial
begin
clk = 1'b0;
#3 start = 1'b1;
#300 $finish;
end
always #5 clk = ~clk;
initial
begin
#13 data_in = 1500;
#10 data_in =192;
end
initial
begin
  $monitor ($time," %d %d   %d  %b %b",DP.A,DP.B, CON.state,lt,gt,  done);
$dumpfile ("gcd.vcd"); $dumpvars (0, GCD_test);
end
endmodule