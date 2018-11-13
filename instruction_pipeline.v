module instruction_pipeline(

	input clk,
	input [31:0] ins_in,
	
	output reg [31:0] ins_out
	
);

always @(posedge clk) begin
	ins_out <= ins_in;
end

endmodule 