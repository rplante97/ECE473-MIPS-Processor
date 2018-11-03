module sign_extend(
	

	input [15:0] in,
	output [31:0] out
);
	
	assign out = $signed(in);

endmodule 