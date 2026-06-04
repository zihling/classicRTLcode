// how to use full adder count no of 1's in 7 bit
module pop_counter (
    input [6:0] in,
    output [2:0] ones
);
    wire sum1, sum2, c1, c2;
    full_adder fa1 (.a(in[0]), .b(in[1]), .cin(in[2]), .sum(sum1), .cout(c1));
    full_adder fa2 (.a(in[3]), .b(in[4]), .cin(in[5]), .sum(sum2), .cout(c2));
    assign ones = sum1 + sum2 + 2 * c1 + 2 * c2 + in[6];
endmodule

// full adder built in 2 half adders

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    wire sum_internal, carry_0, carry_1;

    half_adder ha1 (.a(a), .b(b), .sum(sum_internal), .carry(carry_0));
    half_adder ha2 (.a(sum_internal), .b(cin), .sum(sum), .carry(carry_1));
    assign cout = carry_0 | carry_1;

endmodule

// half adder

module half_adder (
    input a,
    input b,
    output sum, 
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule