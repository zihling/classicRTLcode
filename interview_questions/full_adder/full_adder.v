// full adder built in 2 half adders

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    reg sum_internal, carry_0, carry_1;

    half_adder ha1 (.a(a), .b(b), .sum(sum_internal), .carry(carry_0));
    half_adder ha2 (.a(sum_internal), .b(cin), .sum(sum), .carry(carry_1));
    assign cout = carry_0 | carry_1;

endmodule