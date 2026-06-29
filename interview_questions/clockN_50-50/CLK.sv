// a systemverilog version of clock divider
`timescale 1ns/1ns

module clk_divider #(parameter divider_value=5)(input clk, input rst_n, output new_clk);
    localparam int d = divider_value - 1;
    localparam int width = $clog2(d+1);
    logic rise, fall;
    logic [width-1:0] count;
    logic [width-1:0] D = d[width-1:0];

    // update counter
    always_ff @(posedge clk or negedge rst_n) begin : counter_block
        if (!rst_n)
            count <= 0;
        else if (count == D)
            count <= 0;
        else
            count <= count + 1;
    end

    // update rise edge
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            rise <= 0;
        else if (count == (D >> 1))
            rise <= 1;
        else if (count == D)
            rise <= 0;
    end

    // update fall edge
    always_ff @(negedge clk or negedge rst_n) begin : fall_block
        if (!rst_n)
            fall <= 0;
        else if (d[0] == 0)
            fall <= rise;
    end

    assign new_clk = rise | fall;
endmodule