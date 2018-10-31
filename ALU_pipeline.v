module ALU_pipeline(

	input clk,
	
	input [1:0] write_back,
	input [2:0] mem,
	
	input [31:0] pc_new,
	input zero,
	input [31:0] ALU_result,
	input [31:0] data2,
	input [4:0] write_addr,
	
	output reg [1:0] write_back_out,
	output reg [2:0] mem_out,
	
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
	mem_out <= mem;
	write_back_out <= write_back;
end

endmodule 