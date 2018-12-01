`include "define.h"

module flopen2 (
	input clk,
	input [`WIDTH-1:0] d,
	input en,
	input rst_,
	output reg [`WIDTH-1:0] q);

	always @ (posedge clk or negedge rst_) begin
		if(rst_ == `Enable_) q <= 0;
		else if(en == `Enable) q <= d;
	end
endmodule
/*
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
*/
