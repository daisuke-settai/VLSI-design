`include "define.h"
module alu (
	input [`WIDTH-1:0] a, b,
	input [2:0] alucont,
	output reg [`WIDTH-1:0] result);

	always@(*) begin
		case (alucont)
		`AND: result = a & b;
		`OR: result = a | b; 
                `PLS: result = a + b;
                `AND_: result = a & ~b;
               	`OR_: result = a | ~b;
                `MNS: result = a - b;
                `SLT: result = a < b ? 1 : 0;
		default: result = 0;	
		endcase
	end
endmodule
