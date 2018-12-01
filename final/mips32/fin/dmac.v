`timescale 1ns/10ps
`include "define.h"
module dmactr (
	input [`BUS_ADDR_WIDTH-1:0] addr,
	output reg [`BUS_ADDR_WIDTH-1:0] oaddr,
	input [`DATA_WIDTH-1:0] idata,
	output reg [`DATA_WIDTH-1:0] odata,
	input rw_,
	output reg orw_,
	input cs_,
	input free_,
	input clk);

	reg [10:0] count;
	reg [1:0] state;
	reg [`BUS_ADDR_WIDTH-1:0] dsaddrreg;	
	reg [`BUS_ADDR_WIDTH-1:0] ddaddrreg;
	reg [1:0] mode; 
	reg processing;
	reg [`DATA_WIDTH-1:0] data;

	wire clear, start, stop, config_dsaddr, config_ddaddr, config_mode, config_conut;
	assign clear = (cs_ == `Enable_ && rw_ == `Write && addr == 1 && idata == 1);
	assign start = (cs_ == `Enable_ && rw_ == `Write && addr == 1 && idata == 2);
	assign stop = (cs_ == `Enable_ && rw_ == `Write && addr == 1 && idata == 3);
	assign config_dsaddr = (cs_ == `Enable_ && rw_ == `Write && addr == 2);
	assign config_ddaddr = (cs_ == `Enable_ && rw_ == `Write && addr == 3);  
	assign config_mode = (cs_ == `Enable_ && rw_ == `Write && addr == 4);  
	assign config_count = (cs_ == `Enable_ && rw_ == `Write && addr == 5);  

	always @ (posedge clk) begin
		if (clear) begin
			count <= 0;
			state <= `Read1;
			processing <= `Disable;
		end else if (start) begin
			processing <= `Enable;
		end else if (stop) begin
			processing <= `Disable;
		end else if (config_dsaddr) begin
			dsaddrreg <= idata;
		end else if (config_ddaddr) begin
			ddaddrreg <= idata;
		end else if (config_mode) begin 
			mode <= idata[1:0];
		end else if (config_count) begin 
			count <= idata[10:0];
		end
	end

	always @ (posedge clk) begin
		case (mode)
			`MtoM: if (processing == `Enable && free_ == `Enable_) 
					case(state)
					`Read1: begin
						state <= `Write1;
						orw_ <= `Read;
						oaddr <= dsaddrreg;
						data <= idata;			
						end
					`Write1: begin
						state <= `Read1;
						orw_ <= `Write;
						oaddr <= ddaddrreg;
						odata <= data;
						count <= count - 1;
						if (count != 0) begin 
							dsaddrreg <= dsaddrreg + 1;
							ddaddrreg <= ddaddrreg + 1;
						end else begin
							processing <= `Disable;
						end
						end						
					endcase
			`MtoIO: if (processing == `Enable && free_ == `Enable_)
					case(state)
					`Read1: begin
						state <= `Write1;
						orw_ <= `Read;
						oaddr <= dsaddrreg;
						data <= idata;	
						end		
					`Write1: begin 
						state <= `Read1;
						orw_ <= `Write;
						oaddr <= ddaddrreg;
						odata <= data;
						count <= count - 1;
						if (count != 0) begin 
							dsaddrreg <= dsaddrreg + 1;
						end else begin
							processing <= `Disable;
						end		
						end				
					endcase
			`IOtoM: if (processing == `Enable && free_ == `Enable)
					case(state)
					`Read1: begin
						state <= `Write1;
						orw_ <= `Read;
						oaddr <= dsaddrreg;
						data <= idata;			
						end
					`Write1: begin
						state <= `Read1;
						orw_ <= `Write;
						oaddr <= ddaddrreg;
						odata <= data;
						count <= count - 1;
						if (count != 0) begin 
							ddaddrreg <= ddaddrreg + 1;
						end else begin
							processing <= `Disable;
						end						
						end
					endcase
		endcase
	end
endmodule

