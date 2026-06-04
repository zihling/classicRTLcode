`timescale 1ns/1ns

module testbench ();
    reg [6:0] data;
    wire [2:0] pop;

    task check;
        input [2:0] expected;

        begin
            if (pop != expected)
                $display("Fail at %t: expected=%b, got=%b", $time, expected, pop);
            else
                $display("Pass at %t: got=%b", $time, pop);
        end

    endtask

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
        data = 7'd0; #20;
        data = 7'b1011010; #5; check(4); #15;
        data = 7'd5; #5; check(2); #15;
        data = 7'd63; #5; check(6); #15;
    end

    pop_counter dut (.in(data), .ones(pop));



endmodule