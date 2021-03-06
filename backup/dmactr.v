`timescale 1ns/10ps

`include "define.h"

module dmactr(
	      output reg[`BUS_ADDR_WIDTH-1:0] addr,
	      output reg[`DATA_WIDTH-1:0] odata,
	      input [`DATA_WIDTH-1:0] idata,
	      output reg rw_,
	      output reg breq_,
	      input bgrt_,
	      input [`BUS_ADDR_WIDTH-1:0] dsaddr,
	      input [`BUS_ADDR_WIDTH-1:0] ddaddr,
	      input [1:0] dmode,
	      input dreq_,
	      output reg eop_,
	      input reset_,
	      input clk);

   reg[1:0] 		    state;
   reg [2:0] 		    count;
   reg [`BUS_ADDR_WIDTH-1:0] dsaddreg;
   reg [`BUS_ADDR_WIDTH-1:0] ddaddreg;			     
   always @ (posedge clk)begin
     if(reset_ == `Enable_) begin
	state <= `Wait;
	
     end else begin
	case (dmode)
	  `Single:
       case (state)
	 `Wait: begin if (dreq_ == `Enable_) begin
	    breq_ = `Enable_;
	    state <= `Read1;
	 end
	 eop_ = `Disable_;
	 end
	 `Read1: if (bgrt_ == `Enable_ ) begin
	   addr <= dsaddr;
            rw_ <= `Read;	 
	   state <= `Write1;
	 end
	 `Write1:begin addr <= ddaddr;
	 rw_ <= `Write;
	 odata <= idata;
         state <= `Complete;
	    end
	 `Complete: begin eop_ <= `Enable_;
	 breq_ <= `Disable_;
	 state <= `Wait;
	    end
       endcase // case (state)
	`BURST_MEM_MEM:
	  case (state)
	 `Wait: begin if (dreq_ == `Enable_) begin
	    breq_ <= `Enable_;
	    count <= 4;
	    state <= `Read1;
	 end
	 eop_ <= `Disable_;
	 end
	 `Read1:begin
	   if(count == 4) begin
	      dsaddreg <= dsaddr;
	    ddaddreg <= ddaddr;
	      end
          if (bgrt_ == `Enable_ ) begin
	   addr <= dsaddreg;
            rw_ <= `Read;	 
	   state <= `Write1;
	    count <= count - 1;
	  end
	    end
	 `Write1:begin addr <= ddaddreg;
	 rw_ <= `Write;
	 odata <= idata;
	 if(count != 0) begin
	    dsaddreg <= dsaddreg + 1;
	    ddaddreg <= ddaddreg + 1;
	    state <= `Read1;
	 end else begin
         state <= `Complete;
	 end
	 end // case: `Write1
	 `Complete: begin eop_ <= `Enable_;
	 breq_ <= `Disable_;
	 state <= `Wait;
	    end
	  endcase // case (state)
	 `BURST_MEM_IO:
	  case (state)
	 `Wait: begin  if (dreq_ == `Enable_) begin
	    breq_ <= `Enable_;
	    count <= 4;
	    state <= `Read1;
	    
	 end
	    dsaddreg <= dsaddr;
	    ddaddreg <= ddaddr;
	    
	 eop_ <= `Disable_;
	    end
	 `Read1:begin 
if(count == 4) begin
   dsaddreg <= dsaddr;
	    ddaddreg <= ddaddr;
   end
if (bgrt_ == `Enable_ ) begin
	   addr <= dsaddreg;
            rw_ <= `Read;	 
	   state <= `Write1;
	   count <= count-1;
end
	    end
	 `Write1:begin addr <= ddaddreg;
	 rw_ <= `Write;
	 odata <= idata;
	 if(count != 0) begin
	    dsaddreg <= dsaddreg + 1;
	    state <= `Read1;
	 end else begin
         state <= `Complete;
	 end
	 end // case: `Write1
	    
	 `Complete: begin eop_ <= `Enable_;
	 breq_ <= `Disable_;
	 state <= `Wait;
	 end
	    
	  endcase // case (state)
	 `BURST_IO_MEM:
	  case (state)
	 `Wait: begin if (dreq_ == `Enable_) begin
	    breq_ <= `Enable_;
	    count <= 4;
	    dsaddreg <= dsaddr;
	    ddaddreg <= ddaddr;
	    state <= `Read1;
	 end
	 eop_ <= `Disable_;
	 end
	    
	 `Read1: if (bgrt_ == `Enable_ ) begin
	   addr <= dsaddreg;
            rw_ <= `Read;	 
	   state <= `Write1;
	    count <= count-1;
		  end
       
	 `Write1:begin addr <= ddaddreg;
	 rw_ <= `Write;
	 odata <= idata;
	 if(count != 0) begin
	    ddaddreg <= ddaddreg + 1;
	    state <= `Read1;
	 end else begin
         state <= `Complete;
	 end
	 end // case: `Write1
	    
	 `Complete: begin eop_ <= `Enable_;
	 breq_ <= `Disable_;
	 state <= `Wait;
	 end
	  endcase // case (state)
	endcase // case (dmode)
     end // else: !if(reset_ == `Enable_)
   end // always @ (posedge clk)
  	  endmodule // dmactr

