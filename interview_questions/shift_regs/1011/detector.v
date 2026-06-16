// a shift register that can detect the sequence 1011
// naturally overlapping

module sequence_detector (
    input clk,
    input rst_n,
    input in,
    output seq
);
    reg q1, q2, q3;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q1 <= 1'b0;
            q2 <= 1'b0;
            q3 <= 1'b0;
        end
        else begin
            q1 <= in;
            q2 <= q1;
            q3 <= q2;
        end
    end
    assign seq = in & q1 & ~q2 & q3;
endmodule