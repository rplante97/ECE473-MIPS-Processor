/* A big state machine, since we are only implementing R-type instructions
	we only have a few, relatively simple states. These will be expanded in the future
*/

module controller(


	//inputs (from instruction memory)
	input [31:0] instruction,
	
	//outputs (WIP)
	output reg [1:0] write_back,
	output reg [2:0] memory,
	output reg [3:0] execution,
	output reg [5:0] ALUop,
	output reg jump_register
	
);
	
	initial begin
		jump_register = 0;
		write_back = 0;
		memory = 0;
		execution = 0;
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
	
	always@(*) begin
	
		if ((opcode == 0) && ~(funct_code == 8)) begin
			write_back <= 2'b11;
			memory <= 3'b000;
			execution <= 4'b0001;
			ALUop <= funct_code;
			jump_register <= 0;
		end
		if ((opcode == 0) && (funct_code == 0) && (rd == 0)) begin //nop
			ALUop <= 5'b00000;
			jump_register <= 0;
			write_back <= 2;
		end
		if (funct_code == 8) begin//JR
			jump_register <= 1;
			execution <= 4'b0001;
			write_back <= 2;
		end
	end
	




endmodule 