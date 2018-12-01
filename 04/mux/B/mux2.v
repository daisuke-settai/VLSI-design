module mux2 #(parameter width = 8) (input [width-1:0] d0, d1, input s, output [width-1:0] y);
	assign y = s ? d1 : d0;
endmodule

module mux4 #(parameter width = 4) (input [width-1:0] d0, d1, d2, d3, input [1:0] s, output [width-1:0]y);
	reg [width-1:0] tmp1, tmp2;
	mux2 #(4) u0(d0, d1, s[1:1], tmp1);
	mux2 #(4) u1(d2, d3, s[0:0], tmp2);
	mux2 #(4) u2(tmp1, tmp2, )
