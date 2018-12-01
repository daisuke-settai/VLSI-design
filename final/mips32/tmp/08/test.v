`timescale 1ns/10ps
`include "define.h"
module test();
	reg [`BUS_ADDR_WIDTH-1:0] addr0;
	reg [`DATA_WIDTH-1:0] idata0;
        wire [`DATA_WIDTH-1:0] odata0;
	reg rw0_, breq0_;
	wire bgrt0_;
	reg [`BUS_ADDR_WIDTH-1:0] dsaddr;
	reg [`BUS_ADDR_WIDTH-1:0] ddaddr;
	reg [1:0] dmode;
	reg dreq_;
	wire eop_;
	reg reset_, clk;
	top u0 (addr0, idata0, odata0, rw0_, breq0_, bgrt0_, dsaddr, ddaddr, dmode, dreq_, eop_, reset_, clk);

	always begin
		clk <= 1; #1; clk <= 0; #1;
	end
	initial begin
		#1;
		$dumpfile("dump.vcd");
		$dumpvars(0, test.u0);
		reset_ <= `Enable_;
		#10;
		reset_ <= `Disable_;
		#10;
		addr0 <= 10'h150;
		idata0 <= 8'h99;
		rw0_ <= `Write;
		breq0_ <= `Enable_;
		dreq_ <= `Disable_;
		#10;
		rw0_ <= `Read;
		#5;
		$display("[processor] odata0=%h", odata0);
		#10;
		$display("[DMA single mode]");
		breq0_ <= `Disable_;
		dsaddr <= 10'h150;
		ddaddr <= 10'h160;
		dmode <= `Single;
		dreq_ <= `Enable_;
		#1;
		dreq_ <= `Disable_;
		#10;
		breq0_ <= `Enable_;
		addr0 <= 10'h160;				
		rw0_ <= `Read;
		#10;
		$display("[DMA] odata0=%h", odata0);
		$finish;
	end
endmodule
