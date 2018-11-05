/* TODO DOCUMENTATION
*/
module ALU_32bit(data1, data2, shamt, zero,  ALU_result, ALU_operation);

//Control signal, currently ALU must support 12 instructions
//however opcode/funct is 6 bits
input [5:0] ALU_operation;
//Data from regfile
input [31:0] data1;
input [31:0] data2;
input [4:0] shamt;

output reg zero; //We set zero to high if ALU_result equals zero
output reg [31:0] ALU_result;

always begin
	
	case(ALU_operation)
	
		//TODO: IMPLEMENTATION
		32: //ADD
			ALU_result = data1 + data2;
		33: //ADDU
			ALU_result = data1 + data2;
		34: //SUB
			ALU_result = data1 - data2;
		35: //SUBU
			ALU_result = data1 - data2;
		36: //AND
			ALU_result = data1 & data2;
		37: //OR
			ALU_result = data1 | data2;
		39: //NOR
			ALU_result = ~(data1 | data2);
		42: //SLT
			ALU_result = ($signed(data1) < $signed(data2)) ? 1 : 0;
		0: //SLL
			ALU_result = (data2 << shamt);
		2: //SRL
			ALU_result = (data2 >> shamt);
		3: //SRA
			ALU_result = (data2 >> shamt); //Need to account for sign shifting later!!!
		default:
			ALU_result = 0;
		
	endcase 
		
end

endmodule 

