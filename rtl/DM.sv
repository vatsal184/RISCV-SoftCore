// either read or write
module data_memory(
	input clk,
  	input reset,
	input [31:0]m_addr,
    input [31:0]m_wr_dat,
    input rd_en,
    input wr_en,
    output reg [31:0]m_rd_dat
	);


  reg [31:0]mem[(2**25) - 1:0];
 
  always @(posedge clk) begin
    m_rd_dat <= (rd_en & reset) ? mem[m_addr << 2] : 32'h0;
    if (wr_en & reset)	mem[m_addr << 2] <= m_wr_dat;
  end

endmodule