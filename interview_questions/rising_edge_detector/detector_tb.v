`timescale 1ns/1ns

module testbench();
	reg clk,rst_n;
	reg data_in;
	wire data_out;
	
// checker
task check;
	input expected;

	begin
		@(negedge clk); // check after DUT updates at posedge
		if (data_out != expected)
			$display("Fail at %0t: expected=%b, got=%b", $time, expected, data_out);
		else
			$display("Pass at %0t: data_out=%b", $time, data_out);
	end

endtask

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,testbench);
	clk = 1;
	rst_n = 0; #20;
	rst_n = 1; #40;
	rst_n = 0;
end

// clock generator
always #5 clk = ~clk;


// stimulus
initial begin
	data_in = 1'b0; #15;
	check(0);
	data_in = 1'b1;
	check(1);
	data_in = 1'b0;
	check(0);
	data_in = 1'b1;
	check(1);
	check(0);
	$display("=============Test finished.=============");
	$finish;
end

detector dut
( 	.clk(clk),
	.rst_n(rst_n),
	.data_in(data_in),
	.data_out(data_out)
);

endmodule