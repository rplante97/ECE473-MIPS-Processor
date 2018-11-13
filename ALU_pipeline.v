module ALU_pipeline(

	input clk,
	
	input reg_write,
	input jump_reg,
	input mem_load,
	
	input zero,
	input [31:0] ALU_result,
	input [31:0] data2,
	input [4:0] write_addr,
	
	input mem_store,
	
	output reg reg_write_out,
	output reg jump_reg_out,
	output reg mem_load_out,
	
	output reg zero_out,
	output reg [31:0] result_out,
	output reg [31:0]data2_out,
	output reg [4:0] write_addr_out,
	
	output reg mem_store_out
);

always @(posedge clk) begin
	mem_load_out <= mem_load;
	zero_out <= zero;
	result_out <= ALU_result;
	data2_out <= data2;
	write_addr_out <= write_addr;
	reg_write_out <= reg_write;
	jump_reg_out <= jump_reg;
	mem_store_out <= mem_store;
end

endmodule 