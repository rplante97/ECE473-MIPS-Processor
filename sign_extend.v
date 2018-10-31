module sign_extend(
	

	input [15:0] in,
	input clk,
	
	output reg [31:0] out
);
	always @(posedge clk)begin
		out <= $signed(in);
	end
endmodule 