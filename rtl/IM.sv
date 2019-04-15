
module IM(
    input clk,
  	input reset,
    input [31:0]pc,
    output reg [31:0]instr
    );
    
        
  reg [31:0] IM [1023:0];
  
initial begin 
  $readmemh("ins_mem.txt",IM);
end
  

always_comb begin
	instr = reset ? IM[pc >> 2] : 32'b0;
	$display("PC = %h : instr = %h", pc, instr);
  end

endmodule
