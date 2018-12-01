module mux4 #(parameter width = 8) (input [width-1:0] d0, d1, d2, d3, input [1:0] sel, output [width-1:0] y]);
	
	always @ (*) begin
		if(sel == 0) y <= d0;
		else if(sel == 1) y <= d1;
		else if(sel == 2) y <= d2;
		else if(sel == 3) y <= d3;
	end
endmodule
