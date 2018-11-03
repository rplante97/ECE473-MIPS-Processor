module pipeline_6bit(

	input clk,
	input [5:0] in,
	
	output reg [5:0] out
	
);

always @(posedge clk) begin
	out <= in;
end

endmodule 