`timescale 1ns/10ps
module test ();

reg [3:0] a, b;
wire [3:0] y;

add4 u0 (a, b, y);

initial begin
	a <= 4'b011; b <= 4'b0010;
	#2; $display("sum=%d", y);

	a <= 4'd02; b <= 4'd12;
	#2; $display("sum=%d", y);

	a <= 4'h02; b <= 4'h0c;
	#2; $display("sum=%d", y);
end

endmodule
