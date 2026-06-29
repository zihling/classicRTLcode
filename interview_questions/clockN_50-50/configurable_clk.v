module clk_divider #(parameter DIVIDER_VALUE=3)(input clk, input rst, output new_clk);
    wire [7:0] d = DIVIDER_VALUE - 1;
    reg rise, fall;
    reg [7:0] counter;

    // update counter
    always @(posedge clk or negedge rst) begin
        if (!rst)
            counter <= 0;
        else if (counter == d)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    // update rise edge
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            rise <= 0;
        end
        else if (counter == (d >> 1))
            rise <= 1;
        else if (counter == d)
            rise <= 0;    
    end

    // update fall edge
    always @(negedge clk or negedge rst) begin
        if (!rst)
            fall <= 0;
        else if (d[0] == 1'b0)
            fall <= rise;
    end
    assign new_clk = rise | fall;
endmodule