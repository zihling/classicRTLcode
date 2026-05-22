// a circuit to generate the Fibonacci series

module fibonacci (
    input clk,
    input rst,
    input enable,
    output [31:0] sum
    );
    reg [31:0] curr_num;
    reg [31:0] next_num;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            curr_num <= 32'd0;
            next_num <= 32'd1;
        end
        else if (enable) begin
            curr_num <= next_num;
            next_num <= sum;
        end
    end

    assign sum = curr_num + next_num;

endmodule
