// system verilog version testbench, with some SVA commends

`timescale 1ns/1ns
module CLK_tb;
    parameter divider_value = 7;
    logic clk;
    logic rst_n;
    logic new_clk;

    // instantiate clk divider module
    clk_divider #(.divider_value(divider_value)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .new_clk(new_clk)
    );

    // clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // waveform dump
    initial begin
        $dumpfile("clk_divider_config.vcd");
        $dumpvars(0, CLK_tb);
    end

    // stimulus
    initial begin
        rst_n = 0;
        repeat (3) @(posedge clk);

        rst_n = 1;
        repeat (50) @(posedge clk);

        $finish;
    end

    // basic SVA: reset behavior
    property reset_clear;
        @(posedge clk)
        ! rst_n |-> (dut.count == 0 && dut.rise == 0 && dut.fall == 0);
    endproperty

    assert property (reset_clear)
        else $error("Reset behavior failed.");

    // basic SVA: counter should wrap around after d
    property counter_wrap;
        @(posedge clk) disable iff (!rst_n)
        dut.count == dut.D |=> dut.count == 0;
    endproperty

    assert property (counter_wrap)
        else $error("Counter did not wrap correctly");

    // basic SVA: no X on output
    property no_x_out;
        @(posedge clk) disable iff (!rst_n)
        !$isunknown(new_clk);
    endproperty

    assert property (no_x_out)
        else $error("new_clk has X value");
endmodule