module regfile_pipeline(

	input clk,
	
	input [5:0] ALU_op,
	//input [31:0] data_in1,
	//input [31:0] data_in2,
	input [4:0] write_address,
	input [4:0] shamt,
	
	output reg [5:0] ALU_op_out,
	//output reg [31:0] data_out1,
	//output reg [31:0] data_out2,
	output reg [4:0] write_address_out,
	output reg [4:0] shamt_out
	
);

always @(posedge clk) begin
	ALU_op_out <= ALU_op;
	//data_out1 <= data_in1;
	//data_out2 <= data_in2;
	write_address_out <= write_address;
	shamt_out <= shamt;
end

endmodule 