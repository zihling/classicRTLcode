`timescale 1ns/1ns

module sale_tb;

wire clk, rst_n, sel;
wire [1:0] din;
reg  [1:0] drinks_out;
reg        change_out;

always #10 clk = ~clk;

initial begin
    clk = 0;
    rst_n = 0; #40;
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);
end

endmodule;