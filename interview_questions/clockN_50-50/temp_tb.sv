`timescale 1ns/1ns
module CLK_tb ();
    logic clk;
    logic rst;
    wire target;
    logic [7:0] divider_value;
    time half_per;

    // DUT
    clk_divider #(5) dut (.clk(clk), .rst(rst), .new_clk(target));
    
    // Clock generation
    always #2 clk = ~clk;

    // Reset generation
    initial begin
        clk = 0;
        rst = 0; #20;
        rst = 1;
        #100;
        $finish;
    end

    // stimulus
    initial begin
        divider_value = 8'd5;
        half_per = 5 * divider_value;
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
                if ($time - last_toggle != half_per) begin
                    $error("Wrong divide-by-%0d timing", divider_value);
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