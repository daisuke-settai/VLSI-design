`timescale 1ns/10ps
module test ();

reg  clk, rst_;
wire home;

statemachine u0 (clk, rst_, home);

always begin
	clk <= 1; #1; clk <= 0; #1;
end

initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0, test.u0);
	rst_ <= 0; #3; 
	rst_ <= 1; #10;
	$finish;
end

endmodule
