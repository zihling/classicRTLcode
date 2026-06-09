// Clock divide by N circuit with 50-50 duty

module clk_divider (input clk, input rst, input [7:0] divider_value, output newclk);
    reg rise, fall;
    reg [7:0] posedge_cnt;
    wire [7:0] d = divider_value - 8'd1;

    // update counter
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            posedge_cnt <= 8'd0;
        end
        else begin
            posedge_cnt <= (posedge_cnt == d)? 8'd0 : (posedge_cnt + 8'd1);
        end
    end

    // update rise pulse signal
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            rise <= 1'b0;
        end
        else if (posedge_cnt == {1'b0, d[7:1]})
            rise <= 1'b1;
        else if (posedge_cnt == d)
            rise <= 1'b0; 
    end


    // update fall pulse signal
    always @(negedge clk or negedge rst) begin
        if (!rst)
            fall <= 1'b0;
        else if (d[0] == 1'b0) // when the divider is odd
            fall <= rise;
    end 

    // assign output
    assign newclk = (fall | rise);
endmodule