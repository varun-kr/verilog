// Code your testbench here
// or browse Examples
module freq_div_10_tb;
wire  Q;
reg clk,rst;
freq_div_10 DUT(Q,rst,clk);
initial begin rst = 1; clk=0;
        #7 rst =0 ; end
always #5 clk = ~clk;
initial
begin
$dumpfile("freq_divider.vcd");
$dumpvars(0,freq_div_10_tb);
#1000 $finish;
end
endmodule