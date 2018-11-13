/* A big state machine, since we are only implementing R-type instructions
	we only have a few, relatively simple states. These will be expanded in the future
*/

module controller(


	//inputs (from instruction memory)
	input [31:0] instruction,
	
	//outputs (WIP)
	output reg reg_write, //Enables/disables register write
	output reg [5:0] ALUop,
	output reg jump_register,
	output reg use_imm //Selects muxes to use I-type/R-type instruction format
	
);
	
	initial begin
		jump_register = 0;
		reg_write = 0;
		use_imm = 0;
		ALUop = 0;
	end
	
	wire [5:0] opcode;
	assign opcode = instruction[31:26];
	

	wire [5:0] funct_code;
	wire [4:0] shamt;
	wire [4:0] rd;
	assign funct_code = instruction [5:0];
	assign shamt = instruction[10:6];
	assign rd = instruction[15:11];
	
	always begin
	
		if ((opcode == 0) && ~(funct_code == 8)) begin
			reg_write = 1;
			use_imm = 0;
			ALUop = funct_code;
			jump_register = 0;
		end
		if ((opcode == 0) && (funct_code == 0) && (rd == 0)) begin //nop
			ALUop = 0;
			jump_register = 0;
			reg_write = 0;
			use_imm = 0;
		end
		if (funct_code == 8) begin//JR
			jump_register = 1;
			ALUop = funct_code;
			reg_write = 0;
		end
		
		if (opcode != 0) begin //I-type
		
		end
	end
	




endmodule 