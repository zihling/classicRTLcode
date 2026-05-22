`timescale 1ns/1ns

module clock_tb ();

    logic clk;
    logic rst_n;
    logic pulse;
    wire sec;
    wire min;
    wire hr;

    clock uut (
        .clk(clk),
        .rst(rst_n),
        .ms_pulse(pulse),
        .second(sec),
        .minute(min),
        .hour(hr)
    );

    initial begin
        clk = 0;
        rst_n = 0;
        pulse = 0;
        #20 rst_n = 1; // Release reset after 20ns
    end

    always #5 clk = ~clk; // Generate a clock with a period of 10ns
    always begin
        pulse = 0; #990;
        pulse = 1; #10;
    end // Generate a pulse every 500ns (1ms pulse)

    always @(posedge pulse) begin
        $display("sec=%d", sec);
        $display("min=%d", min);
        $display("hr=%d", hr);
    end
    
    integer log_file;
    integer cycle_count;
    initial begin
        log_file = $fopen("clock_output.log", "w");
        cycle_count = 0;
        if (log_file == 0) begin
            $display("Failed to open log file.");
            $finish;
        end
    end

    always @(posedge clk) begin
        cycle_count = cycle_count + 1;
        if (sec)
            $fdisplay(log_file, "Time %0t: second pulse", $time);
        if (min)
            $fdisplay(log_file, "Time %0t: minute pulse", $time);
        if (hr) begin
            $fdisplay(log_file, "Time %0t: hour pulse", $time);
            $fdisplay(log_file, "First hour pulse detected. Stop simulation.");
            $fclose(log_file);
            $finish;
        end

        if (cycle_count == 300000000) begin
            $fdisplay(log_file, "Reached max cycle count. Stop simulation.");
            $fclose(log_file);
            $finish;
        end

    end 

    // wave file
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, clock_tb);
    end

endmodule