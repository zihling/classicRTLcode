// Clock divide by 3 circuit with 50-50 duty

module CLK (input clk, input rst, output newclk);
    reg rise, fall;
    reg [1:0] posedge_cnt;

    // update counter and rise pulse signal
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            posedge_cnt <= 2'b00;
            rise <= 1'b0;
        end
        else begin
            posedge_cnt <= (posedge_cnt == 2'b10)? 2'b00 : (posedge_cnt + 2'b01);
            rise <= (posedge_cnt == 2'b10)? 1'b1 : 1'b0;
        end
    end

    // update fall pulse signal
    always @(negedge clk or negedge rst) begin
        if (!rst)
            fall <= 1'b0;
        else
            fall <= rise;
    end 

    // assign output
    assign newclk = (fall | rise);
endmodule