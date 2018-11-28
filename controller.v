/* A big state machine, since we are only implementing R-type instructions
	we only have a few, relatively simple states. These will be expanded in the future
*/

module controller(


	//inputs (from instruction memory)
	input [31:0] instruction,
	
	//outputs (WIP)
	output reg reg_write, //Enables/disables register write
	output reg [6:0] ALUop,
	output reg jump_register,
	output reg use_imm, //Selects muxes to use I-type/R-type instruction format
	output reg mem_load, //Selects write back stage mux to use ALU result or data loaded from data mem
	output reg mem_store //Selects if we are writing to mem or not
);
	
	initial begin
		jump_register = 0;
		reg_write = 0;
		use_imm = 0;
		ALUop = 0;
		mem_load = 0;
		mem_store = 0;
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
			mem_load = 0;
			mem_store = 0;
		end
		if (funct_code == 8) begin//JR
			jump_register = 1;
			ALUop = funct_code;
			reg_write = 0;
		end
		
		if (opcode != 0) begin //I-type (for now we will just add a 1 to the msb to determine i type)
			jump_register = 0;
			reg_write = 1;
			use_imm = 1;
			ALUop = opcode;
			ALUop[6] = 1;
			mem_load = 0;
			mem_store = 0;
			if (opcode == 35) begin //LW code (if we loaded a word we want that in mem)
				mem_load = 1;
			end
			if (opcode == 43) begin //SW code (want to store give reg data in mem)
				mem_store = 1;
				mem_load = 0;
				reg_write = 0;
			end
			//Here we basically just want a nop
			if (opcode == 4 || opcode == 5 || opcode == 2) begin //BEQ or BNE or J
				ALUop = 0;
				jump_register = 0;
				reg_write = 0;
				use_imm = 0;
				mem_load = 0;
				mem_store = 0;
			end

		end
	end
	




endmodule 