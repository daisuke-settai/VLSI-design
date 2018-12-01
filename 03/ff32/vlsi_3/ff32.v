module ff32 (
	input [15:0] id, output [15:0] od,
	input [4:0] ia, input clk
);
reg [15:0] mem [0:31];
assign od = mem[ia];
always @ (posedge clk) 
	mem[ia] <= id;
endmodule
