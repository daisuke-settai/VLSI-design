`timescale 1ns/10ps
module test ();

reg  [3:0] d0, d1, d2, d3;
reg  [1:0] sel;
wire [3:0] od;

mux4 u0 (d0, d1, d2, d3, sel, od);

initial begin
	d0 <= 5; d1 <= 6; d2 <= 7; d3 <= 8; #2;
	sel <= 0; #1; $display("od=%d", od);
	sel <= 1; #1; $display("od=%d", od);
	sel <= 2; #1; $display("od=%d", od);
	sel <= 3; #1; $display("od=%d", od);
end

endmodule
