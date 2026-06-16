// generate empty signal in read domain

module rptr_empty #(parameter ADDRSIZE=4) (
    input rclk,
    input rrst_n,
    input r_en,
    input [ADDRSIZE:0] rq2_wptr,
    output [ADDRSIZE-1:0] raddr,
    output reg [ADDRSIZE:0] rptr,
    output reg rempty
);
    reg [ADDRSIZE:0] rbin;
    wire [ADDRSIZE:0] rgraynext, rbinnext;
    wire rempty_val;

    // update rbin and rptr
    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rbin <= 0;
            rptr <= 0;
        end
        else begin
            rbin <= rbinnext;
            rptr <= rgraynext;
        end
    end

    // Memory read-address pointer (okay to use binary to address memory)
    assign raddr = rbin[ADDRSIZE-1:0];
    assign rbinnext = rbin + (r_en & ~rempty);
    assign rgraynext = rbinnext ^ (rbinnext >> 1);

    // FIFO empty when the next rptr == synchronized wptr or on reset
    assign rempty_val = (rgraynext == rq2_wptr);
    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n)
            rempty <= 1'b1;
        else
            rempty <= rempty_val;
    end
endmodule