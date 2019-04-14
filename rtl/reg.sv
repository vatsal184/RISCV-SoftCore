module registers(
  	input clk,
  	input reset,
	input [4:0] rs1,
	input [4:0] rs2,
  	input [4:0] rd,
	input [31:0] reg_wr_dat,
	input regWrite,
	output reg [31:0] rd1,
	output reg [31:0] rd2
	);

  reg [31:0] registry [31:1];
  
  initial begin
    registry[1] = 32'h0;
    registry[2] = 32'h0;
    registry[3] = 32'h0;
    registry[4] = 32'h0;
    registry[5] = 32'h0;
    registry[6] = 32'h0;
    registry[7] = 32'h0;
    registry[8] = 32'h0;
    registry[9] = 32'h0;
    registry[10] = 32'h0;
    registry[11] = 32'h0;
    registry[12] = 32'h0;
    registry[13] = 32'h0;
    registry[14] = 32'h0;
    registry[15] = 32'h0;
    registry[16] = 32'h0;
  end
  
  always_comb begin
  	rd1 =  (reset & (rs1!=5'b0)) ? registry[rs1] : 32'h0;
  	rd2 =  (reset & (rs2!=5'b0)) ? registry[rs2] : 32'h0;
  end
  
  
  always@ (posedge clk) begin    
    if(reset & regWrite & (rd!=5'b0))       registry[rd] <= reg_wr_dat;
  end
  
  
endmodule // registers