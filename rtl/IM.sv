module IM(
    input clk,
  	input reset,
  	input [31:0]INS_BASE_ADDR,
    input [31:0]pc,
    output reg [31:0]instr
    );
    
        
  reg [31:0] IM [255:0];
  
initial begin 
$readmemb("ins_mem.mem",IM);

end
  always @(posedge clk) begin
    if (reset)  instr <= IM[INS_BASE_ADDR + pc];
    else instr <= 32'b0;
  end

endmodule