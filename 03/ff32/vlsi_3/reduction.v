module reduction (
	input [3:0] id, output x, output y
);
assign x = &id;
assign y = |id;
endmodule
