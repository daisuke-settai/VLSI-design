`include "define.h"
module test();
reg [`WIDTH-1:0] a, b;
reg [2:0] alucont; 
wire [`WIDTH-1:0] result;
alu a0(a, b, alucont, result);
integer i;
initial begin
a <= 200; b <= 300; #2;
for (i = 0; i <= 7; i = i + 1) begin
	alucont <= i; #2;
	$display("a=%d b=%d cont=%d result=%d", a, b, alucont, result);
end
a <= 100; b <= 50; #2;
for (i = 0; i <= 7; i = i + 1) begin
        alucont <= i; #2;
        $display("a=%d b=%d cont=%d result=%d", a, b, alucont, result);
end
end
endmodule
