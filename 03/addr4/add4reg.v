module add4reg (input [3:0] a, input [3:0] b, input clk, output [3:0] y);
	reg [3:0] x;
	always @ (posedge clk)
		x <= a + b;
	assign y = x;
endmodule
