/* TODO DOCUMENTATION
*/
module ALU_32bit(ALU_operation, data1, data2, ALU_result, zero);

//Control signal, currently ALU must support 12 instructions
//as such we have 4 bit control signal
input [3:0] ALU_operation;
//Data from regfile
input [31:0] data1;
input [31:0] data2;

output reg [31:0] ALU_result;
output reg zero; //We set zero to high if ALU_result equals zero


//clock on new signals from data1 and data2 or control
always @(data1, data2, ALU_operation) begin
	
	case(ALU_operation)
	
	//TODO: IMPLEMENTATION
		0:
		
		1:
		
		2:
		
		3:
		
		4:
		
		5:
		
		6:
		
		7:
		
		8:
		
		9:
		
		10:
		
		11:
		
		12:
	
	endcase 
	
	
	
	
	
end

endmodule 

