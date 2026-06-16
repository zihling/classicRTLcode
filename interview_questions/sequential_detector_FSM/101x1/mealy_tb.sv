`timescale 1ns/1ns

module mealy_tb ();
    reg clk, rstn;
    reg d;
    wire out;

    always #2 clk = ~clk;

    task drive_and_check;
        input bit_in;
        input expected;
        

        begin
            d = bit_in;
            #2; // wait for combinational Mealy output to settle
            if (out != expected)
                $display("Fail at %0t: d=%d, expected=%d, got=%d", $time, bit_in, expected, out);
            else
                $display("Pass at %0t: d=%d, got=%d", $time, bit_in, out);
        end
    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, mealy_tb);
        clk = 0;
        rstn = 0;
        d = 0;
        #12;
        rstn = 1;
        drive_and_check(1, 0); #2;
        drive_and_check(0, 0); #2;
        drive_and_check(1, 0); #2;
        drive_and_check(0, 0); #2;
        drive_and_check(1, 1); #2; // detects 10101

        drive_and_check(0, 0); #2;
        drive_and_check(1, 1); #2; // detects overlapped 10101 again
        
        d = 0; #20;
        $finish;
    end

    sequence_detector dut (.clk(clk), .rstn(rstn), .d(d), .out(out));
endmodule