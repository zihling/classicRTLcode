// HDLBits CS450/timer

module count_down_timer(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
    reg [9:0] counter;
    always @(posedge clk) begin
        if (load)
            counter <= data;
        else 
            counter <= (counter == 10'd0)? 10'd0 : (counter - 10'd1);
    end
    assign tc = (counter == 10'd0);
endmodule