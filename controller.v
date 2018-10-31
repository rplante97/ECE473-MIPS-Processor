/* A big state machine, since we are only implementing R-type instructions
	we only have a few, relatively simple states. These will be expanded in the future
*/

module controller(


	//inputs (from instruction memory)
	input [5:0] opcode,
	input [15:6] control_data,
	input [5:0] funct,
	
	//outputs (WIP)
	output reg jump
);

always @(*) begin
	if (funct == 8) begin //jump instruction
		jump <= 1;
	end
	else begin
		jump <= 0;
	end
end





endmodule 