`timescale 1ns/10ps
module test();
	reg [3:0] a, b;
	wire [3:0] y0, y1;
	reg clk;
	always begin
		clk <= 1; #1; clk <= 0; #1;
	end
	add4 u0 (a, b, y0);
	add4reg u1 (a, b, clk, y1);
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, test.u0, test.u1); 
		#1;
//		a <= 0; b <= 0; #2;
		a <= 3; b <= 2; #10;
		$finish;
	end
endmodule
