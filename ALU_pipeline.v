module ALU_pipeline(

	input clk,
	input [31:0] ALU_data,
	input [4:0] write_address_in,
	
	output reg [31:0] ALU_data_out,
	output reg [4:0] write_address_out
	
);

always @(posedge clk) begin
	ALU_data_out <= ALU_data;
	write_address_out <= write_address_in;
end

endmodule 