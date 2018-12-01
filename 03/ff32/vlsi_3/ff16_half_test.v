`timescale 1ns/10ps
module test ();

reg  [7:0] id;
wire [7:0] od; 
wire [3:0] half;
reg  [3:0] ia;
reg  clk;

ff16 u0 (id, od, ia, clk);

assign half = od[3:0];

always begin
	clk <= 1; #1; clk <= 0; #1;
end

initial begin #1;
	$dumpfile("dump.vcd");
	$dumpvars(0, test.u0);

	id <= 8'h5a; ia <= 1; #2;
	$display("od=%h", od);
	$display("half=%h", half); $finish;
end
endmodule
