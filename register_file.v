module regfile32x32
  (input [4:0] read_address_1,
   input [4:0] read_address_2,
	input [31:0] write_data_in,
	input [4:0] write_address,
	input write_enable,
   input reset,
	input clock,
	input read_address_debug,
	input clock_debug,
   output reg [31:0] data_out_1,
   output reg [31:0] data_out_2,
	output reg [31:0] data_out_debug);

   reg [31:0] 	 regfile [0:31];
	integer 	 i;
	
	initial begin
	
		for (i = 0; i < 32; i = i + 1) begin
	    regfile[i] <= i;
		end
		
	end


   always @(posedge clock) begin
		
		data_out_1 <= regfile[read_address_1];
		data_out_2 <= regfile[read_address_2];
		
		if (reset) begin
			for (i = 0; i < 32; i = i + 1) begin
				regfile[i] <= 0;
			end	
		end 
		

	 
		else begin
			if (write_enable) regfile[write_address] <= write_data_in;
		end
		
   end
endmodule
