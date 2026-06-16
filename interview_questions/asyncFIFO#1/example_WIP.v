// an async FIFO
// TODO: fix this
module async_fifo #(parameter WORD_WIDTH=8, parameter RAM_DEPTH=256) (
    input wclk,
    input rclk,
    input rst_n,
    input push,
    input pop,
    input [WORD_WIDTH-1:0] data_in,
    output reg [WORD_WIDTH-1:0] data_out,
    output full,
    output empty
);
    localparam ADDR_WIDTH = $clog2(RAM_DEPTH);
    reg [ADDR_WIDTH:0] waddr, waddr_ff1, waddr_ff2;
    reg [ADDR_WIDTH:0] raddr, raddr_ff1, raddr_ff2;
    wire [ADDR_WIDTH:0] raddr_sync;
    wire [ADDR_WIDTH:0] waddr_sync;
    wire [ADDR_WIDTH:0] waddr_gray;
    wire [ADDR_WIDTH:0] raddr_gray;
    wire [ADDR_WIDTH:0] raddr_gray_sync;
    wire [ADDR_WIDTH:0] waddr_gray_sync;
    wire push_valid, pop_valid;
    reg [WORD_WIDTH-1:0] ram [0:RAM_DEPTH-1]; // RAM

    assign waddr_sync = waddr_ff2;
    assign raddr_sync = raddr_ff2;
    bi2gray #(WORD_WIDTH+1) wb (waddr, waddr_gray);
    bi2gray #(WORD_WIDTH+1) rb (raddr, raddr_gray);
    gray2bi #(WORD_WIDTH+1) rg (raddr_gray_sync, raddr_sync);
    gray2bi #(WORD_WIDTH+1) wg (waddr_gray_sync, waddr_sync);

    // update write address
    always @(posedge wclk or negedge rst_n) begin
        if (!rst_n)
            waddr <= 0;
        else if (push_valid)
            waddr <= waddr + 1;
    end

    // update read address
    always @(posedge rclk or negedge rst_n) begin
        if (!rst_n)
            raddr <= 0;
        else if (pop_valid)
            raddr <= raddr + 1;
    end

    // synchronize write_ptr
    always @(posedge rclk or negedge rst_n) begin
        if (!rst_n) begin
            waddr_ff1 <= 0;
            waddr_ff2 <= 0;
        end
        else begin
            waddr_ff1 <= waddr_gray;
            waddr_ff2 <= waddr_ff1;
        end
    end

    // synchronize read_ptr
    always @(posedge wclk or negedge rst_n) begin
        if (!rst_n) begin
            raddr_ff1 <= 0;
            raddr_ff2 <= 0;
        end
        else begin
            raddr_ff1 <= raddr_gray;
            raddr_ff2 <= raddr_ff1;
        end
    end

    assign empty = (waddr_sync == raddr_sync);
    assign full = (waddr_sync[ADDR_WIDTH] != raddr_sync[ADDR_WIDTH]) && (waddr_sync[ADDR_WIDTH-1:0] != raddr_sync[ADDR_WIDTH-1:0]);
    assign pop_valid = pop && (!empty);
    assign push_valid = push & (!full);

    // read
    always @(posedge rclk or negedge rst_n) begin
        if (!rst_n)
            data_out <= 0;
        else if (pop_valid)
            data_out <= ram[raddr[ADDR_WIDTH-1:0]];
    end

    // write
    always @(posedge wclk) begin
        if (push_valid)
            ram[waddr[ADDR_WIDTH-1:0]] <= data_in;
    end
endmodule

module bi2gray #(parameter ADDR_WIDTH=8) (input [ADDR_WIDTH-1:0] bin, output [ADDR_WIDTH-1:0] gray);
    assign gray = bin ^ (bin >> 1);
endmodule

module gray2bi #(parameter ADDR_WIDTH=8) (input [ADDR_WIDTH-1:0] gray, output reg [ADDR_WIDTH-1:0] bin);
    integer i;

    always @(*) begin
        bin[ADDR_WIDTH-1] = gray[ADDR_WIDTH-1];

        for (i = ADDR_WIDTH-2; i >= 0; i = i - 1)
            bin[i] = bin[i+1] ^ gray[i];       
    end
endmodule