// Write-domain to read-domain synchronizer

module sync_w2r #(parameter ADDRSIZE = 4) (
    input [ADDRSIZE:0] wptr,
    input rclk, rrst_n,
    output reg [ADDRSIZE:0] rq2_wptr
);
    reg [ADDRSIZE:0] rq1_wptr;

    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rq2_wptr <= 0;
            rq1_wptr <= 0;
        end
        else begin
            rq1_wptr <= wptr;
            rq2_wptr <= rq1_wptr;
        end
    end
endmodule
