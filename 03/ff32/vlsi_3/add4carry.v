module add4carry (
	input [3:0] a,
	input [3:0] b,
	output carry,
	output [3:0] y
);
assign {carry, y} = a + b;
endmodule
