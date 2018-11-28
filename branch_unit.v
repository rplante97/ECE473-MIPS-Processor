module branch_unit (

	//Base information needed
	input [31:0] instruction,
	input [31:0] sign_ext_imm,
	input [31:0] val1,
	input [31:0] val2,
	input [31:0] pc,

	//Forwarding relevant things
	//If rs or rt was written to by instructions in the execution or mem stage we need to grab those values
	
	//execution stage write register and alu value
	input [4:0] exec_write_reg,
	input [31:0] exec_alu_res,
	
	//mem stage writer register and alu value
	input [4:0] mem_write_reg,
	input [31:0] mem_alu_res,
	
	//Output is just a flag for branching and whatever the value should be if flag is set
	output reg [31:0] pc_value,
	output reg branch

);

	wire [5:0] opcode;
	assign opcode = instruction[31:26];
	
	wire[4:0] rs;
	assign rs = instruction[25:21];
	
	wire[4:0] rt;
	assign rt = instruction[20:16];
	
	wire[25:0] target;
	assign target = instruction[25:0];
	
	integer value_rs;
	integer value_rt;
	
	initial begin
		branch = 0;
	end
	
	always begin 
	//RS
	//First we check exec stage for forwarding
	if (rs == exec_write_reg) begin
		value_rs = exec_alu_res;
	end
	//If exec stage is good check mem stage for forwarding
	else if (rs == mem_write_reg) begin
		value_rs = mem_alu_res;
	end
	//If no forwarding is needed just set value to whatever regfile spit out
	else begin 
		value_rs = val1;
	end
	
	
	//RT
	//First we check exec stage for forwarding
	if (rt == exec_write_reg) begin
		value_rt = exec_alu_res;
	end
	//If exec stage is good check mem stage for forwarding
	else if (rt == mem_write_reg) begin
		value_rt = mem_alu_res;
	end
	//If no forwarding is needed just set value to whatever regfile spit out
	else begin 
		value_rt = val2;
	end
	
	
	//Forwarding taken care of, value_rs and value_rt should now hold correct comparison values
	
	//Currently this logic does not account for SW instructions modifying the register values
	//BEQ
	if(opcode == 4) begin
		
		//If they are equal
		if (value_rt == value_rs) begin
			branch = 1;
			pc_value = pc + sign_ext_imm + 1; //We add 1 here due to the current placement of our mux
		end
		//If not equal
		else begin
			branch = 0;
			pc_value = 0;
		end
	
	end
	
	//BNE
	else if (opcode == 5) begin
		//If equal do nothing
		if(value_rt == value_rs) begin
			branch = 0;
			pc_value = 0;
		end
		//if not equal branch
		else begin
			branch = 1;
			pc_value = pc + sign_ext_imm + 1; //We add 1 here due to the current placement of our mux
		end
	end
	
	//JUMP
	if (opcode == 2) begin
		//Here we just want to jump to the register stored in target
		branch = 1;
		pc_value = ((pc & 32'hf0000000) | (target << 2))/4; //This is just how the target address is calculated for jump instruction
	end
	
	//If we are not on a branch instruction
	else begin 
		branch = 0;
		pc_value = 0;
	end
	
	
	
	end

endmodule 