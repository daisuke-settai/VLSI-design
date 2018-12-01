`include "define.h"
module regfile (output [`WIDTH-1:0] rd1, input [`REGADDR-1:0] ra1,
		output [`WIDTH-1:0] rd2, input [`REGADDR-1:0] ra2,
		input [`WIDTH-1:0] wd, input [`REGADDR-1:0] wa,
		input clk, input regwrite);

		reg [`WIDTH-1:0] ram [0:`REGNUM-1];

		always@ (posedge clk) begin
			if(regwrite == `Enable) ram[wa] = wd;
			assign rd1 = ra1 ? ram[ra1] : 0;
			assign rd2 = ra2 ? ram[ra2] : 0;
		end
endmodule
