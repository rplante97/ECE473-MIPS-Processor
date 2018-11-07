module jumpReg_forward(

	input [31:0] currentRegVal,
	input [4:0] currentRegAddr,
	input [31:0] exRegVal,
	input [4:0] exRegAddr,
	input [31:0] memRegVal,
	input [4:0] memRegAddr,
	
	output reg [31:0] data

);


always begin
	if (exRegAddr == currentRegAddr) begin //if previous instruction modified register, use that value
	
		data = exRegVal;
	end
	else if (memRegAddr == currentRegAddr) begin //if instruction previous to above modified register, use that value
	
		data = memRegVal;
	end
	else begin //if none of the pipelined instructions modified the value use the current one
	
		data = currentRegVal;
	end
end

endmodule 