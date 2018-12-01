`include "define.h" 
module top(
	   input [`BUS_ADDR_WIDTH-1:0] addr0,
	   input [`DATA_WIDTH-1:0] idata0,
	   output [`DATA_WIDTH-1:0] odata0,
	   input rw0_, input breq0_, output bgrt0_,

	   input [`BUS_ADDR_WIDTH-1:0] dsaddr,
	   input [`BUS_ADDR_WIDTH-1:0] ddaddr,
	   input [1:0] dmode,
	   input dreq_,
	   output eop_,
	   input reset_, input clk);

   wire [`BUS_ADDR_WIDTH-1:0] addr1;
   wire [`DATA_WIDTH-1:0]     idata1;
   wire [`DATA_WIDTH-1:0]     odata1;
   wire [`DATA_WIDTH-1:0]     odata;
   wire [`BUS_ADDR_WIDTH-1:0] addr;
   wire [`DATA_WIDTH-1:0]     idata;
   wire 		      rw_;
   
   wire 		      rw1_, breq1_, bgrt1_;
   assign odata0 = odata;
   assign odata1 = odata;
   assign addr = (bgrt0_ == `Enable_ && bgrt1_ == `Disable_) ? addr0: addr1;
   assign idata = (bgrt0_ == `Enable_ && bgrt1_ == `Disable_) ? idata0: idata1;
   assign rw_ = (bgrt0_ == `Enable_ && bgrt1_ == `Disable_) ? rw0_: rw1_;
   slaves u0 (addr, idata, odata, rw_, reset_, clk);
   busarb u1(breq0_, breq1_, bgrt0_, bgrt1_, reset_, clk);
   dmactr u2(addr1, idata1, odata1, rw1_, breq1_, bgrt1_, dsaddr, ddaddr, dmode, dreq_,eop_,reset_, clk);
   
endmodule // top
