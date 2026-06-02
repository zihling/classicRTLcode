`timescale 1ns/1ns

module detector(
	input clk,
	input rst_n,
	input data_in,
	output reg data_out
	);
	reg data_in_reg;
	always @(posedge clk) begin
		if (!rst_n) begin
			data_in_reg <= 1'b0;
			data_out <= 1'b0;
		end
		else begin
			data_in_reg <= data_in;
			data_out <= ~data_in_reg & data_in;
		end
	end
endmodule