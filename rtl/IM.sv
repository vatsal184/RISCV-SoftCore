
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
  always @(posedge clk) begin
    if (reset)	instr = IM[pc >> 2];
    else instr = 32'b0;
  end

endmodule
