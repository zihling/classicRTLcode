
// TODO: write testbench for FIFO



module FIFO (
    input clk,
    input rst,
    input push,
    input pop,
    input [7:0] data_in,
    output fifo_full,
    output fifo_empty,
    output [7:0] data_out
);
    reg [8:0] write_address;
    reg [8:0] read_address;
    wire push_valid;
    wire pop_valid;

    always @(posedge clk or negedge rst) begin
        if (!rst) 
            write_address <= 9'd0;
        else if (push_valid)
            write_address <= write_address + 9'd1;
    end

    always @(posedge clk or negedge rst) begin
        if (!rst) 
            read_address <= 9'd0;
        else if (pop_valid)
            read_address <= read_address + 9'd1;
    end

    assign fifo_full = ((write_address[8] != read_address[8]) && (write_address[7:0] == read_address[7:0]));
    assign fifo_empty = (write_address == read_address);
    assign push_valid = push && !fifo_full;
    assign pop_valid = pop && !fifo_empty;

    RAM ram(clk, rst, push_valid, write_address[7:0], data_in, pop_valid, read_address[7:0], data_out);

endmodule