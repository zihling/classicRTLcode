// low-active reset signal. Asynchronous assertion, synchronous deassertion

`timescale 1ns/1ns

module rst_n_sync(
input clk,
input rst_n,
input d,
output reg dout
 );

//*************code***********//
    wire rst_sync;
    reg rst_ff1, rst_ff2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rst_ff1 <= 1'd0;
            rst_ff2 <= 1'd0;
        end
        else begin
            rst_ff1 <= 1'd1;
            rst_ff2 <= rst_ff1;
        end
    end
    assign rst_sync = rst_n & rst_ff2;
    always @(posedge clk or negedge rst_sync) begin
        if (!rst_sync)
            dout <= 1'd0;
        else
            dout <= d;
    end

//*************code***********//
endmodule