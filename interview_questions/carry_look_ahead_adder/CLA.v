`timescale 1ns/1ns

module CLA // 4-bit carry look-ahead adder
(
	input wire [3:0]A,
	input wire [3:0]B,
	output wire [4:0]OUT
);

//*************code***********//
	wire [3:0] p, g;
	wire [4:1] carry;
	Add1 add0 (.a(A[0]), .b(B[0]), .C_in(1'b0), .f(OUT[0]), .p(p[0]), .g(g[0]));
	Add1 add1 (.a(A[1]), .b(B[1]), .C_in(carry[1]), .f(OUT[1]), .p(p[1]), .g(g[1]));
	Add1 add2 (.a(A[2]), .b(B[2]), .C_in(carry[2]), .f(OUT[2]), .p(p[2]), .g(g[2]));
	Add1 add3 (.a(A[3]), .b(B[3]), .C_in(carry[3]), .f(OUT[3]), .p(p[3]), .g(g[3]));
	CLA_4 cla (.P(p), .G(g), .C_in(1'b0), .Ci(carry), .Gm(), .Pm()); 
	assign OUT[4] = carry[4];
//*************code***********//
endmodule

module Add1
(
		input a,
		input b,
		input C_in,
		output f,
		output g,
		output p
		);
	assign f = a ^ b ^ C_in;
	assign p = a ^ b;
	assign g = a & b;
endmodule

module CLA_4(
		input [3:0]P,
		input [3:0]G,
		input C_in,
		output [4:1]Ci,
		output Gm,
		output Pm
	);
	assign Ci[1] = G[0] | P[0] & C_in;
	assign Ci[2] = G[1] | (P[1] & (G[0] | P[0] & C_in));
	assign Ci[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & (G[0] | P[0] & C_in));
	assign Ci[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & (G[0] | P[0] & C_in));
	assign Pm = & P[3:0];
	assign Gm = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
endmodule