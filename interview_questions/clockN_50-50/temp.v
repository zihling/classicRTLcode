module clk (input clk, input rst, inut [7:0] divider_value, output new_clk);
    reg rise, fall;
    reg [7:0] posedge_cnt;
    wire [7:0] d = divider_value - 8'd1;

    always @(posedge clk or nededge rst) begin
        if (!rst)
            posedge_cnt <= 8'd0;
        else
            posedge_cnt <= (posedge_cnt == d)? 8'd0:(posedge_cnt + 8'd1); 
    end

    always @(posedge clk or negedge rst) begin
        if (!rst)
            rise <= 1'b0;
        else if (posedge_cnt == {1'b0, d[7:1]})
            rise <= 1'b1;
        else if (posedge_cnt == d)
            rise <= 1'b0;
    end

    always @(negedge clk or negedge rst) begin
        if (!rst)
            fall <= 1'b0;
        else if (d[0] == 1'b0)
            fall <= rise;
    end

    assign new_clk = fall | rise;
endmodule