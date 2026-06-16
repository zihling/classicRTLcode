// sync fifo with parameters for configuration during instantiation process

module sync_FIFO #(parameter WORD_WIDTH=8, parameter RAM_DEPTH=256) (
    input clk,
    input rst_n,
    input push,
    input pop,
    input [WORD_WIDTH-1:0] data_in,
    output reg [WORD_WIDTH-1:0] data_out,
    output full,
    output empty
);
    localparam ADDR_WIDTH = $clog2(RAM_DEPTH);
    reg [ADDR_WIDTH:0] waddr;
    reg [ADDR_WIDTH:0] raddr;
    wire push_valid, pop_valid;
    reg [WORD_WIDTH-1:0] ram [0:RAM_DEPTH-1]; // RAM

    // update write address
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            waddr <= 0;
        else if (push_valid)
            waddr <= waddr + 1;
    end

    // update read address
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            raddr <= 0;
        else if (pop_valid)
            raddr <= raddr + 1;
    end

    // empty and full signal
    assign empty = (waddr == raddr);
    assign full = (waddr[ADDR_WIDTH] != raddr[ADDR_WIDTH]) && (waddr[ADDR_WIDTH-1:0] == raddr[ADDR_WIDTH-1:0]);
    // valid signal: I assume push is ignored when full, even if pop happens in the same cycle.
    assign pop_valid = pop & (!empty);
    assign push_valid = push & (!full);

    // read
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            data_out <= 0;
        else if (pop_valid)
            data_out <= ram[raddr[ADDR_WIDTH-1:0]];
    end

    // write
    always @(posedge clk) begin
        if (push_valid)
            ram[waddr[ADDR_WIDTH-1:0]] <= data_in;
    end

endmodule