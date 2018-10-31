module regfile_pipeline(

	input clk,
	
	input [1:0] wb,
	input [2:0] mem,
	input [3:0] exec,
	
	input [31:0] pc,
	input [31:0] data_in1,
	input [31:0] data_in2,
	input [31:0] sign_ext,
	input [4:0] ins1,
	input [4:0] ins2,
	
	output reg [1:0] wb_out,
	output reg [2:0] mem_out,
	output reg [3:0] exec_out,
	
	output reg [31:0] pc_out,
	output reg [31:0] data_out1,
	output reg [31:0] data_out2,
	output reg [31:0] sign_ext_out,
	output reg [4:0] ins1_out,
	output reg [4:0] ins2_out
	
);

always @(posedge clk) begin
	pc_out <= pc;
	data_out1 <= data_in1;
	data_out2 <= data_in2;
	sign_ext_out <= sign_ext;
	ins1_out <= ins1;
	ins2_out <= ins2;
	wb_out <= wb;
	mem_out <= mem;
	exec_out <= exec;
end

endmodule 