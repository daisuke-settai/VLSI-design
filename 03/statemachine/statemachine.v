`define SLEEP	2'b00
`define CLASS	2'b01
`define STUDY	2'b10
`define MEETING	2'b11
module statemachine (input clk, input rst_, output reg home, output reg tired);
	reg [1:0] status;
	always @ (posedge clk or negedge rst_)
		if (rst_ == 0) begin
			status <= `SLEEP; home <= 1;
		end else begin
			case (status)
			`SLEEP : begin status <= `SLEEP; home <= 0; end
			`CLASS : begin
				 status <= `STUDY; end
			`STUDY : begin status <= `MEETING; end
			`MEETING : begin status <= `SLEEP; home <= 1; end
			endcase
		end
endmodule
