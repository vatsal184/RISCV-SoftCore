
`include "wrapper.sv"

module test();

reg clk;
reg reset;
  
initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  clk = 0;
  reset = 0;
  #26 reset = 1;
end

always #5 clk = ~clk;

  riscv_wrapper test(.clk(clk),.reset(reset),.trap(trap));
  
always@(*) begin
  if (trap)	$finish;
end

/*initial begin
    #2000 $finish;
end*/
 
endmodule