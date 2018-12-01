module add4 (input [3:0] a, input [3:0] b, output [3:0] y);
	wire [3:0] x;
	assign x = a + b;
	assign y = x;
endmodule
