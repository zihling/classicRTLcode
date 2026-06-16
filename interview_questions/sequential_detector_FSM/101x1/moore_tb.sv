`timescale 1ns/1ns

module moore_tb ();
    reg clk, rstn;
    reg d;
    wire out;

    always #2 clk = ~clk;

    task check;
        input expected;

        begin
            @(negedge clk);
            if (out != expected)
                $display("Fail at %0t: expected=%d, got=%d", $time, expected, out);
            else
                $display("Pass at %0t: got=%d", $time, out);
        end
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, moore_tb);
        clk = 0;
        rstn = 0;
        d = 0;
        #12;
        rstn = 1;
        d = 1; #4;
        d = 0; #4;
        d = 1; #4;
        d = 0; #4;
        d = 1; #4;
        check(1);
        d = 0; #4;
        check(0);
        d = 1; #4;
        check(1);
        d = 1; #8;
        d = 1; #4;
        check(0);
        d = 0; #20;

        d = 1; #4;
        d = 0; #4;
        d = 1; #4;
        d = 1; #4;
        d = 1; #4;
        check(1);
        d = 0; #4;
        check(0);
        d = 1; #4;
        check(0);
        d = 1; #8;
        check(1);
        d = 0; #20;
        $finish;
    end

    sequence_detector dut (.clk(clk), .rstn(rstn), .d(d), .out(out));
endmodule