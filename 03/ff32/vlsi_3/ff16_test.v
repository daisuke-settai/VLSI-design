`timescale 1ns/10ps
module test ();

reg  [15:0] id;
wire [15:0] od;
reg  [4:0] ia;
reg  clk;

ff16 u0 (id, od, ia, clk);

always begin
	clk <= 1; #1; clk <= 0; #1;
end

initial begin #1;
	$dumpfile("dump.vcd");
	$dumpvars(0, test.u0);

	id <= 16'h9999; ia <= 1; #2;
	id <= 16'h000e; ia <= 5; #2;
	$display("od=%h", od); $finish;
end
endmodule
