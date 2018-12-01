`include "define.h"
module timer (input [`MEM_ADDR_WIDTH-1:0] addr, input [`DATA_WIDTH-1:0] idata, output [`DATA_WIDTH-1:0] odata, input cs_, input rw_, input clk);
	reg [31:0] count;
	reg en;
	wire clear, start, stop;
	assign clear = (cs_ == `Enable_ && rw_ == `Write && addr == 1 && idata == 1);
        assign start = (cs_ == `Enable_ && rw_ == `Write && addr == 1 && idata == 2);
        assign stop = (cs_ == `Enable_ && rw_ == `Write && addr == 1 && idata == 4);

	always @ (posedge clk)
		if (clear)	count <= 0;
		else if (en)	count <= count + 1;
	always @ (posedge clk)
		if (start)	en <= `Enable;
		else if (stop)	en <= `Disable;
	assign odata = (addr == 0) ? count: 0;
endmodule
