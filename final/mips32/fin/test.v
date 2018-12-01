`timescale 1ns/100ps
`include "define.h"
module top #(parameter WIDTH = 32, REGBITS = 3)();

	   reg                 clk;
   reg                 reset_;
   wire                memread1, memwrite1;
   wire    [WIDTH-1:0] adr1, writedata1;
   wire    [WIDTH-1:0] memdata1;
   wire                breq1_, bgrt1_, done1;
   wire                memread2, memwrite2;
   wire    [WIDTH-1:0] adr2, writedata2;
   wire    [WIDTH-1:0] memdata2;
   wire                breq2_, bgrt2_, done2;
   wire                free_, done;
   wire    [WIDTH-1:0] adr, idata, odata, odata0, odata1, odata2, odata3;
   wire                rw_, memread, memwrite;
   wire                cs0_, cs1_, cs2_, cs3_;
   wire    [WIDTH-1:0] oadr;
   wire                orw_;

   // 5nsec --> 200MHz
   parameter STEP = 5.0;

   mips p0(clk, reset_, memdata1, memread1, memwrite1, adr1, writedata1, breq1_, done1, bgrt1_);
   mips p1(clk, reset_, memdata2, memread2, memwrite2, adr2, writedata2, breq2_, done2, bgrt2_);
   busarb u0(breq1_, breq2_, bgrt1_, bgrt2_, free_, done, reset_, clk);
   done_mux u1(done1, done2, bgrt1_, bgrt2_, done);
   addrdec u2(adr, cs0_, cs1_, cs2_, cs3_);
   sram_start u3(adr[`MEM_ADDR_WIDTH-1:0], idata, odata0, cs0_, rw_, clk);
   sram u4(adr[`MEM_ADDR_WIDTH-1:0], idata, odata1, cs1_, rw_, clk);
   timer u5(adr[`MEM_ADDR_WIDTH-1:0], idata, odata2, cs2_, rw_, clk);
   dmactr u6(adr[`MEM_ADDR_WIDTH-1:0], oadr, idata, odata3, rw_, orw_, cs3_, free_, clk);

   assign rw_ = (bgrt1_ == `Enable_ && memread1 == `Enable) ? `Read :
                (bgrt1_ == `Enable_ && memwrite1 == `Enable) ? `Write :
                (bgrt2_ == `Enable_ && memread2 == `Enable) ? `Read :
                (bgrt2_ == `Enable_ && memwrite2 == `Enable) ? `Write : orw_;
   assign odata = (cs0_ == `Enable_) ? odata0 :
                  (cs1_ == `Enable_) ? odata1 :
                  (cs2_ == `Enable_) ? odata2 :
                  (cs3_ == `Enable_) ? odata3 : 0;
   assign adr = (free_ == `Enable_) ? oadr : adr;
   assign idata = (bgrt1_ == `Enable_) ? memdata1 :
                  (bgrt2_ == `Enable_) ? memdata2 : odata3;
   assign memdata1 = odata;
   assign memdata2 = odata;


   // initialize test
   initial
      begin
         clk <= 0; reset_ <= `Enable_; # 22; reset_ <= `Disable;
         // dump waveform
         $dumpfile("dump.vcd");
         $dumpvars(0, u0);
         // stop at 1,000 cycles
         #(STEP*1000);
         $finish;
      end

   // generate clock to sequence tests
   always #(STEP/2)
      begin
         clk <= ~clk;
      end

   always@(negedge clk)
      begin
         if(rw_ == `Write) begin
            $display("Data [%d] is stored in Address [%d]", odata, adr);
            //Modified by matutani
            //if(adr == 5 & writedata == 7) begin
            if(adr == 20) begin
            //
               $display("Simulation completely successful");
               $finish;
            end else begin
               $display("Simulation failed");
               $finish;
            end
        end
      end
endmodule
