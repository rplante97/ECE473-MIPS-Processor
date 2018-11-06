module pc_plus4(

	input[31:0] pc_current,
	
	output[31:0] pc_next

);

	assign pc_next = pc_current + 1;

endmodule 