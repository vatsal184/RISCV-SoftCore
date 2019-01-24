`include "csr.sv"
`include "IM.sv"
`include "DM.sv"
`include "core.sv"


module riscv_wrapper#(parameter INS_BASE_ADDR = 32'h0,
                     parameter DATA_BASE_ADDR = 32'h80000000,
                     parameter DATA_WIDTH = 32)(
	input clk,
	input reset);
  
  wire [31:0] pc , csr_wr_data, csr_rd_data, m_addr, m_wr_dat;
  reg [31:0]instr ,m_rd_dat;
  wire [11:0]csr_rd_addr;
  
  riscv_core#(
    		.DATA_WIDTH(DATA_WIDTH)  )
  			cpu(
    		.clk(clk),.reset(reset),
                 
            .pc(pc),.instr(instr),
            
            .csr(csr),
            .csr_rd_addr(csr_rd_addr),
            .csr_wr_data(csr_wr_data),
            .csr_rd_data(csr_rd_data),
            
            .MemRead(MemRead),
            .MemWrite(MemWrite),
            .m_addr(m_addr),
            .m_wr_dat(m_wr_dat),
            .m_rd_dat(m_rd_dat)
           );

 IM ins_mem(.clk(clk),
            .reset(reset),
            .pc(pc + INS_BASE_ADDR),
            .instr(instr)
           );

  
cs_reg csre(.clk(clk),
            .reset(reset),
            .csr(csr),
            .rd_addr(csr_rd_addr),
            .csr_rd(csr_rd_data),
            .wr_dat(csr_wr_data)
           );
  
memory mem(.clk(clk),
             .reset(reset),
             .m_addr(m_addr),
             .m_wr_dat(m_wr_dat),
             .rd_en(MemRead),
             .wr_en(MemWrite),
             .m_rd_dat(m_rd_dat)
            );
  
  /*
  always @(pc) begin
  $display("PC          = %d  ",pc);
  $display("Reset       = %d  ",reset);
  $display("Instruction = 0x%h  ",instr);
//  $display("ALU output  = %d  ",m_addr); 
//  if (MemWrite) $display("Data 0x%h written to address %d",m_wr_dat, m_addr);
    $display("---------------------------------------------------------------");*/
end
  
  endmodule