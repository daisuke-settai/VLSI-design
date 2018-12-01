`timescale 1ns/10ps
`include "define.h"
module dmactr (
	// DMACTR <===> memory, I/O device 
	output reg [`BUS_ADDR_WIDTH-1:0] addr, output reg [`DATA_WIDTH-1:0] odata, input [`DATA_WIDTH-1:0] idata, output reg rw_,
	// DMACTR <===> busarbiter
	output reg breq_, input bgrt_,
	//  CPU => DMACTR
	input [`BUS_ADDR_WIDTH-1:0] dsaddr, input [`BUS_ADDR_WIDTH-1:0] ddaddr, input [1:0] dmode,
	input dreq_, // usually signal from I/O device
	output reg eop_,
	input reset_, input clk);

	reg[2:0] count;
	reg [1:0] state;
	reg [`BUS_ADDR_WIDTH-1:0] dsaddrreg;	
	reg [`BUS_ADDR_WIDTH-1:0] ddaddrreg;
	
always @ (posedge clk) begin
if(reset_ == `Enable_) begin
	state <= `Wait;
	breq_ <= `Disable_;
end else begin case (dmode)
	`Single: case (state)
		`Wait: begin if (dreq_ == `Enable_) begin
				breq_ <= `Enable_;
				state <= `Read1;
			end 
			eop_ <= `Disable_;			
			end
		`Read1: if(bgrt_ == `Enable_) begin
				addr <= dsaddr;
				rw_ <=`Read;
				state <= `Write1;
			end
		`Write1: if(bgrt_ == `Enable_) begin
				addr <= ddaddr;
				rw_ <= `Write;
				odata <= idata;
				state <= `Complete;
			end
		`Complete: begin eop_ <= `Enable_;
				breq_ <= `Disable_;
				state <= `Wait;
			end
		endcase
	`MtoM: case (state)
		`Wait: begin if (dreq_ == `Enable_) begin
				breq_ <= `Enable_;
				state <= `Read1;
				count <= 4;
				dsaddrreg <= dsaddr;
				ddaddrreg <= ddaddr;
			end
			eop_ <= `Disable_;			
			end
		`Read1: if(bgrt_ == `Enable_) begin
				addr <= dsaddrreg;
				rw_ <=`Read;
				state <= `Write1;
				count <= count - 1;
			end
		`Write1: if(bgrt_ == `Enable_) begin
				addr <= ddaddrreg;
				rw_ <= `Write;
				odata <= idata;
				if(count != 0) begin
					dsaddrreg <= dsaddrreg + 1;
					ddaddrreg <= ddaddrreg + 1;
					state <= `Read1;
				end else begin
				state <= `Complete;
				end
			end
		`Complete: begin eop_ <= `Enable_;
				breq_ <= `Disable_;
				state <= `Wait;
			end
		endcase
	`MtoIO: case (state)
		`Wait: begin if (dreq_ == `Enable_) begin
				breq_ <= `Enable_;
				state <= `Read1;
				count <= 4;
				dsaddrreg <= dsaddr;
				ddaddrreg <= ddaddr;
			end 
			eop_ <= `Disable_;			
			end
		`Read1: if(bgrt_ == `Enable_) begin
				addr <= dsaddrreg;
				rw_ <=`Read;
				state <= `Write1;
				count <= count - 1;
			end
		`Write1: if(bgrt_ == `Enable_) begin
				addr <= ddaddrreg;
				rw_ <= `Write;
				odata <= idata;
				if(count != 0) begin
					dsaddrreg <= dsaddrreg + 1;
					state <= `Read1;
				end else begin
				state <= `Complete;
				end
			end
		`Complete: begin eop_ <= `Enable_;
				breq_ <= `Disable_;
				state <= `Wait;
			end
		endcase
	`IOtoM: case (state)
		`Wait: begin if (dreq_ == `Enable_) begin
				breq_ <= `Enable_;
				state <= `Read1;
				count <= 4;
				dsaddrreg <= dsaddr;
				ddaddrreg <= ddaddr;
			end 
			eop_ <= `Disable_;			
			end
		`Read1: if(bgrt_ == `Enable_) begin
				addr <= dsaddrreg;
				rw_ <=`Read;
				state <= `Write1;
				count <= count - 1;
			end
		`Write1: if(bgrt_ == `Enable_) begin
				addr <= ddaddrreg;
				rw_ <= `Write;
				odata <= idata;
				if(count != 0) begin
					ddaddrreg <= ddaddrreg + 1;
					state <= `Read1;
				end else begin
				state <= `Complete;
				end
			end
		`Complete: begin eop_ <= `Enable_;
				breq_ <= `Disable_;
				state <= `Wait;
			end
		endcase
	endcase 
end
end
endmodule

