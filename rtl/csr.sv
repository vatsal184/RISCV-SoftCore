module cs_reg(
    input clk,
  	input reset,
  	input csr_rd,
  	input csr_wr,
  	input [11:0]rd_addr,
  	input [11:0]wr_addr,
  output reg [31:0]rd_dat,
	input [31:0]wr_dat

);

  reg [31:0]csrm[4095:0];

  initial begin
    csrm[3860] = 32'h0;
    csrm[768] = 32'h0;
    csrm[833] = 32'h0;
    csrm[770] = 32'h0; 
  end
  
  always_comb begin
    rd_dat =  (csr_rd & reset) ? csrm[rd_addr] : 32'h0;
  end

  
  always @(posedge clk) begin
    if (csr_wr & reset)       csrm[wr_addr] <= wr_dat;
  end
 
 
endmodule