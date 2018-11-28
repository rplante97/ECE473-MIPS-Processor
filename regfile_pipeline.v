module regfile_pipeline(

	input clk,
	
	input reg_write,
	input jump_reg,
	input use_imm,
	input mem_load,
	
	input [31:0] data_in1,
	input [31:0] data_in2,
	input [31:0] sign_ext,
	input [4:0] ins1,
	input [4:0] ins2,
	input [31:0] full_ins,
	
	input mem_store,
	input [6:0] aluOp,
	input stall,
	
	output reg reg_write_out,
	output reg jump_reg_out,
	output reg use_imm_out,
	output reg mem_load_out,
	
	output reg [31:0] data_out1,
	output reg [31:0] data_out2,
	output reg [31:0] sign_ext_out,
	output reg [4:0] ins1_out,
	output reg [4:0] ins2_out,
	output reg [31:0] full_ins_out,
	
	output reg mem_store_out,
	output reg [6:0] aluOp_out
	
);

always @(posedge clk) begin
	if (stall) begin //If stall is set, insert nop (set everything to 0)
		mem_load_out <= 0;
		data_out1 <= 0;
		data_out2 <= 0;
		sign_ext_out <= 0;
		ins1_out <= 0;
		ins2_out <= 0;
		jump_reg_out <= 0;
		reg_write_out <= 0;
		use_imm_out <= 0;
		full_ins_out <= 0;
		mem_store_out <= 0;
		aluOp_out <= 0;
	end
	else begin
		mem_load_out <= mem_load;
		data_out1 <= data_in1;
		data_out2 <= data_in2;
		sign_ext_out <= sign_ext;
		ins1_out <= ins1;
		ins2_out <= ins2;
		jump_reg_out <= jump_reg;
		reg_write_out <= reg_write;
		use_imm_out <= use_imm;
		full_ins_out <= full_ins;
		mem_store_out <= mem_store;
		aluOp_out <= aluOp;
	end
end

endmodule 