module regfile_pipeline(

	input clk,
	
	input reg_write,
	input jump_reg,
	input use_imm,
	
	input [31:0] pc,
	input [31:0] data_in1,
	input [31:0] data_in2,
	input [31:0] sign_ext,
	input [4:0] ins1,
	input [4:0] ins2,
	input [31:0] full_ins,
	
	output reg reg_write_out,
	output reg jump_reg_out,
	output reg use_imm_out,
	
	output reg [31:0] pc_out,
	output reg [31:0] data_out1,
	output reg [31:0] data_out2,
	output reg [31:0] sign_ext_out,
	output reg [4:0] ins1_out,
	output reg [4:0] ins2_out,
	output reg [31:0] full_ins_out
	
);

always @(posedge clk) begin
	pc_out <= pc;
	data_out1 <= data_in1;
	data_out2 <= data_in2;
	sign_ext_out <= sign_ext;
	ins1_out <= ins1;
	ins2_out <= ins2;
	jump_reg_out <= jump_reg;
	reg_write_out <= reg_write;
	use_imm_out <= use_imm;
	full_ins_out <= full_ins;
end

endmodule 