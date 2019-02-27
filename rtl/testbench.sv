//`timescale <time_units> / <precision>

`include "wrapper.sv"

module test();

reg clk;
reg reset;
  reg trap;

initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  clk = 0;
  reset = 0;
  #8 reset = 1;
end

always #2 clk = ~clk;

  riscv_wrapper test(.clk(clk),.reset(reset),.trap(trap));
initial begin

  if (trap) $finish;
end
 
endmodule
