module ALU_control(

	input [5:0] instruction_code,
	input [1:0] alu_op,
	
	output reg [5:0] alu_ctrl

);

	wire [5:0] ins;
	assign ins = instruction_code [5:0];

	always @(instruction_code, alu_op) begin
		if (alu_op == 0) begin //R -Type
			alu_ctrl <= ins;
		end
	end
endmodule 