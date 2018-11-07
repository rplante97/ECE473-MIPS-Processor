module data_forwarding(

	//Inputs: 
	//Destination register (rd) of instruction in EX/MEM pipeline
	//Read registers (rs and rt) of instruction behind (ID/EX) pipeline
	
	
	//Data lines going into alu
	input [31:0] data_in1,
	input [31:0] data_in2,
	
	//Register address of data_in1 and data_in2
	input [4:0] rs,
	input [4:0] rt,
	
	//ALU result and destination register from instruction ahead
	input [31:0] aluResult,
	input [4:0] dest_register,
	
	
	
	//Outputs:
	//Forward ALU result of first instruction if neccassary 
	
	//Data output to alu, with changed values if neccassary
	output reg [31:0] data_out1,
	output reg [31:0] data_out2


);


always begin
	if (rs == dest_register) begin //if we are about to write a new value to one of the next operations calculation registers
		//Foward the alu result to rs (data_out1)
		data_out1 = aluResult;
		data_out2 =  data_in2;
		
	end
	else if (rt == dest_register) begin
		//Foward the alu result to rt (data_out2)
		data_out1 = data_in1;
		data_out2 = aluResult;
		
	end
	else begin //Here we don't need to make any changes, just forward the outputs
		
		data_out1 = data_in1;
		data_out2 =  data_in2;
		
	end
end
	
endmodule 