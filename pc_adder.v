/* NOTE: CURRENTLY WE ONLY SUPPORT R-TYPE INSTRUCTIONS, BEHAVIOR MAY CHANGE
Increments the program counter by 4 in order to feed instruction memory with
address of the next instruction

OUTPUTS
next_instruction: the address of the next instruction to be executed

INPUTS
current_instruction: the address of the instruction that is currently being
							executed, this is incremented by 4 then sent to output
*/
module pc_adder(current_instruction, next_instruction);

//TODO: technically we only care about 6 bit addresses in mem, so change this later?
input [31:0] current_instruction;
output reg [31:0] next_instruction;

always @(current_instruction) begin //since our program counter is already clocked this need not be
	next_instruction <= current_instruction + 4;
end

endmodule 