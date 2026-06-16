// The top -level FIFO module

module fifo #(parameter DSIZE = 8, parameter ASIZE = 4) (
    input rclk, r_en, rrst_n,
    input wclk, w_en, wrst_n,
    input [DSIZE-1:0] wdata,
    output [DSIZE-1:0] rdata,
    output wfull, rempty
);
    wire [ASIZE-1:0] waddr, raddr;
    wire [ASIZE:0] wptr, rptr, wq2_rptr, rq2_wptr;

    sync_r2w #(.ADDRSIZE(ASIZE)) sync_r2w (.rptr(rptr), .wclk(wclk), .wrst_n(wrst_n), .wq2_rptr(wq2_rptr));

    sync_w2r #(.ADDRSIZE(ASIZE)) sync_w2r (.wptr(wptr), .rclk(rclk), .rrst_n(rrst_n), .rq2_wptr(rq2_wptr));

    fifomem #(.DATASIZE(DSIZE), .ADDRSIZE(ASIZE)) fifomem (.wdata(wdata), .rdata(rdata), .waddr(waddr), .raddr(raddr), .wclk(wclk), .wfull(wfull), .w_en(w_en));

    rptr_empty #(.ADDRSIZE(ASIZE)) rptr_empty (.rclk(rclk), .rrst_n(rrst_n), .r_en(r_en), .rq2_wptr(rq2_wptr), .raddr(raddr), .rptr(rptr), .rempty(rempty));

    wptr_full #(.ADDRSIZE(ASIZE)) wptr_full (.wclk(wclk), .wrst_n(wrst_n), .w_en(w_en), .wq2_rptr(wq2_rptr), .waddr(waddr), .wptr(wptr), .wfull(wfull));

endmodule