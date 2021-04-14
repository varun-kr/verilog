// Code your testbench here
// or browse Examples
module test;
  reg [15:0] data_in;
  reg clk,start;
  wire done;
  data_path dp(eqz,ld_a,ld_b,ld_p,clr,decb,data_in,clk);
  controller con(done,ld_a,ld_b,ld_p,decb,clr,clk,start,eqz);
initial
begin
clk = 1'b0;
#3 start = 1'b1;
#10000 $finish;
end
always #5 clk = ~clk;
  initial
begin
#17 data_in = 282;
#10 data_in = 1;
end
initial
begin
  $monitor ($time, " %d %b %d %d ", dp.Y, done,dp.decb,dp.eqz);
$dumpfile ("mul.vcd"); $dumpvars (0, test);
end
endmodule