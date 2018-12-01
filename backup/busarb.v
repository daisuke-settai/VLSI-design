`timescale 1ns/10ps

`include "define.h"
module busarb(
	      input breq0_, input breq1_, output bgrt0_, output bgrt1_, input reset_, input clk);

   reg 		    busstate;
   assign bgrt0_ = (busstate == `BGRT0) ? `Enable_: `Disable_;
   assign bgrt1_ = (busstate == `BGRT1) ? `Enable_: `Disable_;
   always @ (posedge clk)
     if(reset_ == `Enable_) begin
	busstate <= `BGRT0;
     end else begin
       case (busstate)
	 `BGRT0: if (breq0_ == `Disable_ && breq1_ == `Enable_)
	   busstate <= `BGRT1;
	 `BGRT1: if (breq0_ == `Enable_ && breq1_ == `Disable_)
	   busstate <= `BGRT0;
       endcase // case (state)
     end
endmodule // busarb