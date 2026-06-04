`timescale 1ns/1ns

module testbench ();
    reg [3:0] A, B;
    wire gt, eq, lt;
    
    task check;
        input [2:0] expected;

        begin
            if (expected != {gt, eq, lt})
                $display("Fail at %t: expected=%b, got=%b", $time, expected, {gt, eq, lt});
            else
                $display("Pass at %t: got=%b", $time, {gt, eq, lt});
        end
        
    endtask

    initial begin
        A = 3'b000; B= 3'b000; #10;

        A = 3'b110; B = 3'b011; #5; check(3'b100); #10;

        A = 3'b001; B = 3'b100; #5; check(3'b001); #10;

        A = 3'b111; B = 3'b111; #5; check(3'b010); #10;

        $finish;
    end

    comparator dut (.A(A), .B(B), .A_gt_B(gt), .A_eq_B(eq), .A_lt_B(lt));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);
    end
endmodule