`include "define.h"

module flopen (
	input clk,
	input [`WIDTH-1:0] d,
	input en,
	output reg [`WIDTH-1:0] q);

	always @ (posedge clk)
		if(en == `Enable) q <= d;
	
endmodule

module test;
	reg clk, en;
	reg [`WIDTH-1:0] in;
	wire [`WIDTH-1:0] out;
	flopen f1(clk, in, en, out);

	always begin
		clk <= 0; #1;
		clk <= 1; #1;
	end

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, test);
		in = 10;
		#10;
		en = `Enable;
		#10;
		in = 20;
		#10;
		en = `Disable;
		#10;
		in = 30;
		#10;
		$finish;
	end
endmodule
