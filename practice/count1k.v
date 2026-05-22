// HDLBits/Building Larger Circuits/count1k

module count1k (
    input clk,
    input reset,
    output [9:0] q);

    reg [9:0] q_next;

    always @(*) begin
        if (q == 10'd999)
            q_next = 10'd0;
        else
            q_next = q + 10'd1;
    end

    always @(posedge clk) begin
        if (reset)
            q <= 10'd0;
        else
            q <= q_next;
    end
endmodule