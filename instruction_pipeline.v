module instruction_pipeline(

	input clk,
	input [31:0] ins_in,
	input [31:0] pc_in,
	input stall,
	
	output reg [31:0] ins_out,
	output reg [31:0] pc_out
	
);

always @(posedge clk) begin
	if(stall) begin
	//do nothing
	end
	else begin
	ins_out <= ins_in;
	pc_out <= pc_in;
	end
end

endmodule 