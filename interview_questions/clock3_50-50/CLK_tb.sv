// testbench for CLK module
`timescale 1ns/1ns
module CLK_tb ();
    logic clk;
    logic rst;
    wire target;

    // DUT
    CLK dut (.clk(clk), .rst(rst), .newclk(target));
    
    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        clk = 0;
        rst = 0; #20;
        rst = 1;
    end

    // Monitor
    always @(posedge clk) begin
        $display("clk=%0d", clk);
        $display("new_clk=%0d", target);
    end

    // Checker / Assertion
    time last_toggle;
    always @(target) begin
        if (rst) begin
            if (last_toggle != 0) begin
                if ($time - last_toggle != 15) begin
                    $error("Wrong divide-by-3 timing");
                end
                else begin
                    $info("Right rising edge");
                end
            end
            last_toggle = $time;
        end
    end

    // Waveform dump
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, CLK_tb);
    end


endmodule