module pc_adder(

	input [31:0] pc,
	input [31:0] sign_ext,
	
	output [31:0] add_result

);

	assign add_result = (pc + (sign_ext << 2));
	

endmodule 