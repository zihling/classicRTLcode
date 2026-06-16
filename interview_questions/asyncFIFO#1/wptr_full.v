// generate full signal in write domain

module wptr_full #(parameter ADDRSIZE=4) (
    input wclk,
    input wrst_n,
    input w_en,
    input [ADDRSIZE:0] wq2_rptr,
    output [ADDRSIZE-1:0] waddr,
    output reg [ADDRSIZE:0] wptr,
    output reg wfull
);
    wire wfull_val;
    wire [ADDRSIZE:0] wgraynext, wbinnext;
    reg [ADDRSIZE:0] wbin;

    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            wbin <= 0;
            wptr <= 0;
        end
        else begin
            wbin <= wbinnext;
            wptr <= wgraynext;
        end
    end

    // Memory write-address pointer (okay to use binary to address memory)
    assign waddr = wbin[ADDRSIZE-1:0];

    assign wbinnext = wbin + (w_en & ~wfull);
    assign wgraynext = wbinnext ^ (wbinnext >> 1);

    // assign wfull_val = (wgraynext[WIDTH-1] != rptr_sync[WIDTH-1]) && (wgraynext[WIDTH-2] != rptr_sync[WIDTH-2]) && (wgraynext[WIDTH-3:0] == rptr_sync[WIDTH-3:0]);
    assign wfull_val = (wgraynext == {~wq2_rptr[ADDRSIZE:ADDRSIZE-1], wq2_rptr[ADDRSIZE-2:0]}); // a simpler way to write
    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n)
            wfull <= 1'b0;
        else
            wfull <= wfull_val;
    end
endmodule