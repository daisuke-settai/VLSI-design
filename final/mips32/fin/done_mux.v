`include "define.h"
module done_mux (input d0, input d1, input s0_, input s1_, output reg y);
	always @(*)
		if (s0_ == `Enable_)
			y <= d0;
		else if (s1_ == `Enable_)
			y <= d1;
		else
			y <= 0;
		
	
endmodule
