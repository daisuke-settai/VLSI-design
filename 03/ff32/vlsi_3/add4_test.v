`timescale 1ns/10ps
module test ();

reg [3:0] a, b;
wire [3:0] y;

add4 u0 (a, b, y);

initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0, test.u0);
	a <= 0; b <= 0; #2;
	a <= 3; b <= 2; #2;
	$display("sum=%d",y);
end

endmodule
