`timescale 1ns/1ns

module top_module(
	input clk_a,
	input clk_b,
	input rst_n
);
	wire ack, req;
	wire [3:0] data;
	// reset synchronizer here
	wire rst_a, rst_b;
	reg rst_a_sync, rst_a_deassert, rst_b_sync, rst_b_deassert;
	always @(posedge clk_a or negedge rst_n) begin
		if (!rst_n) begin
			rst_a_sync <= 1'b0;
			rst_a_deassert <= 1'b0;
		end
		else begin
			rst_a_sync <= 1'b1;
			rst_a_deassert <= rst_a_sync;
		end
	end
	always @(posedge clk_b or negedge rst_n) begin
		if (!rst_n) begin
			rst_b_sync <= 1'b0;
			rst_b_deassert <= 1'b0;
		end
		else begin
			rst_b_sync <= 1'b1;
			rst_b_deassert <= rst_b_sync;
		end
	end
	assign rst_a = rst_n & rst_a_deassert;
	assign rst_b = rst_n & rst_b_deassert;
	data_driver dd (.clk_a(clk_a), .rst_n(rst_a), .data_ack(ack), .data(data), .data_req(req));
	data_receiver dr (.clk_b(clk_b), .rst_n(rst_b), .data_ack(ack), .data(data), .data_req(req));
endmodule

module data_driver(
	input clk_a,
	input rst_n,
	input data_ack,
	output reg [3:0]data,
	output reg data_req
	);
	reg ack_reg1, ack_reg2; // capture rising edge of data_ack, 2 flip-flops synchronizer
	reg [2:0] count;

	// capture data_ack signal rising edge
	always @(posedge clk_a or negedge rst_n) begin
		if (!rst_n) begin
			ack_reg1 <= 1'b0;
			ack_reg2 <= 1'b0;
		end
		else begin
			ack_reg1 <= data_ack;
			ack_reg2 <= ack_reg1;
		end
	end

	// update data
	always @(posedge clk_a or negedge rst_n) begin
		if (!rst_n) begin
			data <= 4'd0;
		end
		else begin
			if (ack_reg1 && !ack_reg2) begin
				if (data == 4'd7)
					data <= 4'd0;
				else
					data <= data + 4'd1;
			end
			else begin
				data <= data;
			end
		end
	end

	// update count
	always @(posedge clk_a or negedge rst_n) begin
		if (!rst_n)
			count <= 3'd0;
		else begin
			if (ack_reg1 && !ack_reg2) // start to count if capture rising edge of data_ack signal
				count <= 3'd0; 
			else if (data_req) // keep count same when sending data to receiver
				count <= count;
			else
				count <= count + 3'd1;
		end
	end

	// update data_req signal
	always @(posedge clk_a or negedge rst_n) begin
		if (!rst_n)
			data_req <= 1'b0;
		else begin
			if (count == 3'd4) // time to send new data
				data_req <= 1'b1;
			else if (ack_reg1 && !ack_reg2)
				data_req <= 1'b0;
			else
				data_req <= data_req;
		end
	end
endmodule

module data_receiver(
	input clk_b,
	input rst_n,
	input data_req,
	input [3:0] data,
	output reg data_ack
	);
	reg req_reg1, req_reg2; // capture rising edge of data_req, 2 flip-flops synchronizer
	reg [3:0] data_mem;

	// capture rising edge of data_req
	always @(posedge clk_b or negedge rst_n) begin
		if (!rst_n) begin
			req_reg1 <= 1'b0;
			req_reg2 <= 1'b1;
		end
		else begin
			req_reg1 <= data_req;
			req_reg2 <= req_reg1;
		end
	end

	// update data_mem based on input data
	always @(posedge clk_b or negedge rst_n) begin
		if (!rst_n)
			data_mem <= 4'd0;
		else if (req_reg1 && !req_reg2) // receive new data
			data_mem <= data;
		else
			data_mem <= data_mem;
	end

	// update data_ack signal
	always @(posedge clk_b or negedge rst_n) begin
		if (!rst_n)
			data_ack <= 1'b0;
		else if (req_reg1) // receive new data
			data_ack <= 1'b1;
		else
			data_ack <= 1'b0;
	end
endmodule