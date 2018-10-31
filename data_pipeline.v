module data_pipeline(

	input clk,
	input [1:0] write_back,
	input [31:0] data,
	input [31:0] ALU_result,
	input [4:0] reg_address,
	
	
	output reg [1:0] write_back_out,
	output reg [31:0] data_out,
	output reg [31:0] result_out,
	output reg [4:0] reg_address_out
	
	
);

always @(posedge clk) begin
	//data_out <= data;
	result_out <= ALU_result;
	write_back_out <= write_back;
	reg_address_out <= reg_address;
end

endmodule 