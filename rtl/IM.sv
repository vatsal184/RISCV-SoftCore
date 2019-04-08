module IM(
    input clk,
  	input reset,
    input [31:0]pc,
    output [31:0]instr
    );
    
        
  reg [31:0] IM [1023:0];
  wire [31:0] next_pc;
  
initial begin 
  $readmemh("ins_mem.txt",IM);
end
  
    assign instr = reset ? IM[pc >> 2] : 32'b0;

endmodule
