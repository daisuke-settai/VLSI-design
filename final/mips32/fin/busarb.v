`timescale 1ns/10ps

`include "define.h"
module busarb (input breq0_, input breq1_, output bgrt0_, output bgrt1_, output free_, input done, input reset_, input clk);
	reg prev_user;
	reg state;
	reg done_reg;
	
	assign bgrt0_ = (state == `BGRT0) ? `Enable_: `Disable_;
	assign bgrt1_ = (state == `BGRT1) ? `Enable_: `Disable_;
	assign free_  = (state == `Free ) ? `Enable_: `Disable_;

	always @ (posedge clk) begin
		if (reset_ == `Enable_) begin
			prev_user <= `P1;
			done_reg <= `Done;
			state <= `Free;
		end else if (done == `Enable) begin
			done_reg <= `Done;
			state <= `Free;
		end else begin
			if (done_reg == `Done && breq0_ == `Enable_ && breq1_ == `Enable_ && prev_user == `P0) begin
				state <= `BGRT1;
				prev_user <= `P1;
				done_reg <= `Not_Done;
			end else if (done_reg == `Done && breq0_ == `Enable_ && breq1_ == `Enable_ && prev_user == `P1) begin
				state <= `BGRT0;
				prev_user <= `P0;
				done_reg <= `Not_Done;
			end else if (done_reg == `Done && breq0_ == `Enable_) begin
				state <= `BGRT0;
				prev_user <= `P0;
				done_reg <= `Not_Done;
			end else if (done_reg == `Done && breq1_ == `Enable_) begin
				state <= `BGRT1;
				prev_user <= `P1;
				done_reg <= `Not_Done;
			end else if (done_reg == `Done) begin
				state <= `Free;
			end
		end
	end
endmodule			
