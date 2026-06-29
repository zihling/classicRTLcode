`timescale 1ns/1ns

module tb_CLA;

    logic [3:0] A;
    logic [3:0] B;
    logic [4:0] OUT;

    integer errors, i, j;

    CLA dut (.A(A), .B(B), .OUT(OUT));

    initial begin
        errors = 0;

        for (i = 0; i < 16; i++) begin
            for (j = 0; j < 16; j++) begin
                A = i[3:0];
                B = j[3:0];
                #1; // wait for combinational logic to settle

                if (OUT !== (A + B)) begin
                    $display("ERROR: A=%d, B=%d, OUT=%d, expected=%d", A, B, OUT, A+B);
                    errors++;
                end
            end
        end

        if (errors == 0)
            $display("PASS: all test cases passed.");
        else
            $display("FAIL: %0d errors found", errors);
    end

endmodule