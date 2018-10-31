/* TODO DOCUMENTATION
*/
module ALU_32bit(ALU_operation, data1, data2, shamt, ALU_result, zero);

//Control signal, currently ALU must support 12 instructions
//however opcode/funct is 6 bits
input [5:0] ALU_operation;
//Data from regfile
input [31:0] data1;
input [31:0] data2;
input [4:0] shamt;

output reg [31:0] ALU_result;
output reg zero; //We set zero to high if ALU_result equals zero


//clock on new signals from data1 and data2 or control
always @(data1, data2, ALU_operation) begin
	
	case(ALU_operation)
	
		//TODO: IMPLEMENTATION
		32: //ADD
			ALU_result <= data1 + data2;
		33: //ADDU
			ALU_result <= data1 + data2;
		34: //SUB
			ALU_result <= data1 - data2;
		35: //SUBU
			ALU_result <= data1 - data2;
		36: //AND
			ALU_result <= data1 & data2;
		37: //OR
			ALU_result <= data1 | data2;
		39: //NOR
			ALU_result <= ~(data1 | data2);
		42: //SLT
			ALU_result <= ($signed(data1) < $signed(data2)) ? 1 : 0;
		0: //SLL
			ALU_result <= (data2 << shamt);
		2: //SRL
			ALU_result <= (data2 >> shamt);
		3: //SRA
			ALU_result <= (data2 >> shamt); //Need to account for sign shifting later!!!
		8: //jr
			ALU_result <= ALU_result;
		
		
				
		
		
	endcase 
	
	
	
	
	
end

endmodule 

