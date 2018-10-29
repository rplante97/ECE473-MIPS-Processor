/* Program Counter (PC).v
Counts through instruction memory starting at
0x00400000 and sends the result to the address line of instruction_mem

OUTPUTS
result: the memory address sent to instruction memory i.e the next instruction

INPUTS 
next: The next memory address to be passed through to result, provided by the hardware adder
clk: the system clock
write: control line to enable "next" to write to "result", at program termination the control module
		 can ground this line to prevent instruction execution

*/


module program_counter(next, result, reset, clk, write);
input [31:0] next;
input reset, clk, write;

output reg [31:0] result;

initial begin //our instruction segement begins at 0x00400000
	result <= 32'h00400000;
end


always @(posedge clk)
begin

	if (reset == 1) begin
		result <= 32'h00400000;
	end
	
	else begin
		if (write == 1) begin
			result <= next;
		end
	end
end

endmodule