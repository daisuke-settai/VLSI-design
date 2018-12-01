/*
module mux4 (
	input [3:0] d0, input [3:0] d1, input [3:0] d2, input [3:0] d3,
	input [1:0] sel, 
	output [3:0] od
);
assign od =	(sel == 2'b00) ? d0 :
		(sel == 2'b01) ? d1 :
		(sel == 2'b10) ? d2 : d3;
endmodule
*/

/*
module mux4 (
	input [3:0] d0, input [3:0] d1, input [3:0] d2, input [3:0] d3,
	input [1:0] sel, 
	output reg [3:0] od
);
always @ (*)
	if (sel == 2'b00) od = d0;
	else if (sel == 2'b01) od = d1;
	else if (sel == 2'b10) od = d2;
	else od = d3;
endmodule
*/

/*
module mux4 (
	input [3:0] d0, input [3:0] d1, input [3:0] d2, input [3:0] d3,
	input [1:0] sel, 
	output reg [3:0] od
);
always @ (*)
	case (sel)
		2'b00: od = d0;
		2'b01: od = d1;
		2'b10: od = d2;
		default: od = d3;
	endcase
endmodule
*/

module mux4 (
	input [3:0] d0, input [3:0] d1, input [3:0] d2, input [3:0] d3,
	input [1:0] sel, 
	output [3:0] od
);

assign od = mux4_func(d0, d1, d2, d3, sel);

function [3:0] mux4_func(
	input [3:0] d0, input [3:0] d1, input [3:0] d2, input [3:0] d3,
	input [1:0] sel
);
begin
	case (sel)
		2'b00:   mux4_func = d0;
		2'b01:   mux4_func = d1;
		2'b10:   mux4_func = d2;
		default: mux4_func = d3;
	endcase
end
endfunction

endmodule
