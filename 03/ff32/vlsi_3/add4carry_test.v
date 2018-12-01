`timescale 1ns/10ps
module test ();

reg [3:0] a, b;
wire [3:0] y;
wire carry;

add4carry u0 (a, b, carry, y);

initial begin
	a <= 14; b <= 5; #2;
	$display("sum=%d c=%d", y, carry);
end

endmodule
