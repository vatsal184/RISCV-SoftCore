// Code your testbench here
// or browse Examples
//`timescale <time_units> / <precision>

`include "wrapper.sv"

module test();

reg clk;
reg reset;

initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  clk = 0;
  reset = 0;
  #16 reset = 1;
end

always #5 clk = ~clk;

  riscv_wrapper test(.clk(clk),.reset(reset),.trap(trap));
initial begin
  if (trap)	$finish;
end

initial begin
    #500 $finish;
end
 
endmodule