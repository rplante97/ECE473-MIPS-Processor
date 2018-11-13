module data_pipeline(

	input clk,
	input reg_write,
	input [31:0] data,
	input [31:0] ALU_result,
	input [4:0] reg_address,
	input jump_reg,
	
	
	output reg reg_write_out,
	output reg [31:0] data_out,
	output reg [31:0] result_out,
	output reg [4:0] reg_address_out,
	output reg jump_reg_out
	
	
);

always @(posedge clk) begin
	//data_out <= data;
	result_out <= ALU_result;
	reg_write_out <= reg_write;
	reg_address_out <= reg_address;
	jump_reg_out <= jump_reg;
end

endmodule 