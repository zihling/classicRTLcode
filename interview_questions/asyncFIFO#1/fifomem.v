// The FIFO memory buffer is typically an instantiated ASIC or FPGA dual-port, synchronous memory device.

module fifomem #(parameter DATASIZE = 8, //  Memory data word width
                 parameter ADDRSIZE = 4) // Number of mem address bits
(
    input [DATASIZE-1:0] wdata,
    input [ADDRSIZE-1:0] waddr, raddr,
    input wclk, wfull, w_en,
    output [DATASIZE-1:0] rdata
);
    localparam DEPTH = 1 << ADDRSIZE;
    reg [DATASIZE-1:0] mem [0:DEPTH-1];

    assign rdata = mem[raddr];

    always @(posedge wclk) begin
        if (w_en && !wfull)
            mem[waddr] <= wdata;
    end
endmodule