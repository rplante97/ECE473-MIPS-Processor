module jumpReg_forward(

	input [31:0] currentRegVal,
	input [4:0] currentRegAddr,
	input [31:0] exRegVal,
	input [4:0] exRegAddr,
	input [31:0] memRegVal,
	input [4:0] memRegAddr,
	input [31:0] wbRegVal,
	input [4:0] wbRegAddr,
	input [31:0] instruction,
	input [31:0] preceding_instruction,
	
	output reg [31:0] data,
	output reg stall

);

	wire [5:0] opcode;
	assign opcode = instruction[31:26];
	
	wire[4:0] rs;
	assign rs = instruction[25:21];
	
	wire[4:0] rt;
	assign rt = instruction[20:16];
	
	wire [5:0] pre_opcode;
	assign pre_opcode = preceding_instruction[31:26];

initial begin
	stall = 0;
end

always begin
	stall = 0;
	if (exRegAddr == currentRegAddr) begin //if previous instruction modified register, use that value
	
		data = exRegVal;
	end
	else if (memRegAddr == currentRegAddr) begin //if instruction previous to above modified register, use that value
	
		data = memRegVal;
	end
	//This resolves a timing issue for I-Type instructions - may not be neccassary, but I am unable to get any other solution working
	else if (wbRegAddr == currentRegAddr) begin //if instruction previous to above modified register, use that value
		data = wbRegVal;
	end
	else begin //if none of the pipelined instructions modified the value use the current one
	
		data = currentRegVal;
	end
	
	
	//Check to make sure we dont need to stall instead of forward
	if (pre_opcode == 35) begin //if last instruction we executed was a LW
		if(exRegAddr == rs) begin //Is rs the same register as what we just loaded a word into?
			stall = 1;
		end
		else if (exRegAddr == rt) begin //Is rs the same register as what we just loaded a word into?
			stall = 1;
		end
		else begin //No register match, no need to stall
			stall = 0;
		end
	end
	
end

endmodule 