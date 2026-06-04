`timescale 100ps/100ps

module toggle_synchronizer(
	input 				clka	, 
	input 				clkb	,   
	input 				rst_n		,
	input				sig_a		,

	output  		 	sig_b
);
    reg Q_siga, Q1, Q2, Q_out;

	always @(posedge clka or negedge rst_n) begin
		if (!rst_n)
			Q_siga <= 1'b0;
		else if (sig_a)
			Q_siga <= ~Q_siga;
		else
			Q_siga <= Q_siga;
	end

	always @(posedge clkb or negedge rst_n) begin
		if (!rst_n) begin
			Q1 <= 1'd0;
			Q2 <= 1'd0;
			Q_out <= 1'd0;
		end
		else begin
			Q1 <= Q_siga;
			Q2 <= Q1;
			Q_out <= Q2;
		end
	end
	assign sig_b = Q_out ^ Q2;
endmodule