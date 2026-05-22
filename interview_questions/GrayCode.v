// A 3-bit Gray Code Generator
// gray = binary ^ (binary >> 1)

module GrayCode (
    input clk,
    input reset,
    output [2:0] gray
    );
    reg [2:0] counter;

    always @(*) begin
        case (counter)
            3'b000: gray <= 3'b000;
            3'b001: gray <= 3'b001;
            3'b010: gray <= 3'b011;
            3'b011: gray <= 3'b010;
            3'b100: gray <= 3'b110;
            3'b101: gray <= 3'b111;
            3'b110: gray <= 3'b101;
            3'b001: gray <= 3'b100;
            default: gray <= 3'b000;
        endcase
    end

    always @(posedge clk or negedge reset) begin
        if (!reset)
            counter <= 3'b000;
        else
            counter <= counter + 3'd1;
    end
endmodule

// a simpler way
module GrayCode (
    input clk,
    input reset,
    output [2:0] gray
    );
    reg [2:0] counter;

    assign gray = counter ^ {1'b0, counter[2:1]};

    always @(posedge clk or negedge reset) begin
        if (!reset)
            counter <= 3'b000;
        else
            counter <= counter + 3'd1;
    end
endmodule