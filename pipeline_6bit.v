module pipeline_6bit(

	input clk,
	input [6:0] in,
	
	output reg [6:0] out
	
);

always @(posedge clk) begin
	out <= in;
end

endmodule 