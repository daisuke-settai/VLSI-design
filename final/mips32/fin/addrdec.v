`timescale 1ns/10ps

`include "define.h"
module addrdec(
	       input [`BUS_ADDR_WIDTH-1:0] addr,
	       output cs0_, output cs1_, output cs2_, output cs3_);
   assign cs0_ = (addr[`BUS_ADDR_WIDTH-1:`BUS_ADDR_WIDTH-2] == 2'b00) ? `Enable_: `Disable_;
   assign cs1_ = (addr[`BUS_ADDR_WIDTH-1:`BUS_ADDR_WIDTH-2] == 2'b01) ? `Enable_: `Disable_;
   assign cs2_ = (addr[`BUS_ADDR_WIDTH-1:`BUS_ADDR_WIDTH-2] == 2'b10) ? `Enable_: `Disable_;
   assign cs3_ = (addr[`BUS_ADDR_WIDTH-1:`BUS_ADDR_WIDTH-2] == 2'b11) ? `Enable_: `Disable_;
endmodule // addrdec
