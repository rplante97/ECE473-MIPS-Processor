module ALU_pipeline(

	input clk,
	
	input reg_write,
	input jump_reg,
	
	input [31:0] pc_new,
	input zero,
	input [31:0] ALU_result,
	input [31:0] data2,
	input [4:0] write_addr,
	
	output reg reg_write_out,
	output reg jump_reg_out,
	
	output reg [31:0] pc_out,
	output reg zero_out,
	output reg [31:0] result_out,
	output reg [31:0]data2_out,
	output reg [4:0] write_addr_out
);

always @(posedge clk) begin
	pc_out <= pc_new;
	zero_out <= zero;
	result_out <= ALU_result;
	data2_out <= data2;
	write_addr_out <= write_addr;
	reg_write_out <= reg_write;
	jump_reg_out <= jump_reg;
end

endmodule 