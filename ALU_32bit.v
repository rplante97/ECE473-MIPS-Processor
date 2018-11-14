/* TODO DOCUMENTATION
*/
module ALU_32bit(data1, data2, shamt, zero,  ALU_result, ALU_operation);

//Control signal, currently ALU must support 12 instructions
//however opcode/funct is 6 bits
input [6:0] ALU_operation;
//Data from regfile
input [31:0] data1;
input [31:0] data2;
input [4:0] shamt;

output reg zero; //We set zero to high if ALU_result equals zero
output reg [31:0] ALU_result;

always begin
	
	case(ALU_operation)
	
		//R TYPE INSTRUCTION START
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
			ALU_result = ($signed(data2) >>> shamt); //Need to account for sign shifting later!!!
		8: //JR (forward the value in the selected register)
			ALU_result = data1;
			
		//I TYPE INSTRUCTION START
		64+12: //ANDI
			ALU_result = data1 & data2;
		64+13: //ORI
			ALU_result = data1 | data2;
		64+10: //SLTI
			ALU_result = ($signed(data1) < $signed(data2)) ? 1 : 0;
		64+8:  //ADDI
			ALU_result = data1 + data2;
		64+9:  //ADDIU
			ALU_result = data1 + data2;
		64+15: //LUI
			ALU_result = (data2 << 16);
		64+35: //LW
			ALU_result = (data1 + data2)/4; //We divide by 4 since we are operating in terms of words
		64+43: //SW
			ALU_result = (data1 + data2)/4; //same as lw
		default:
			ALU_result = data1;
		
	endcase 
		
end

endmodule 

