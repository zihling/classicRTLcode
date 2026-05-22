// a clock circuit outputs 3 signals: second, hour, minute, input pulse occurs every 1 ns

module clock (
    input clk,
    input rst,
    input ms_pulse,
    output second,
    output minute,
    output hour
    );
    reg [9:0] ms_counter;
    reg [5:0] second_counter;
    reg [5:0] minute_counter;

    // update ms_counter
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            ms_counter <= 10'd0;
        end
        else if (ms_pulse) begin
            if (ms_counter == 10'd999)
                ms_counter <= 10'd0;
            else
                ms_counter <= ms_counter + 10'd1;
        end
    end

    // update second_counter
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            second_counter <= 6'd0;
        end
        else if (second) begin
            if (second_counter == 6'd59)
                second_counter <= 6'd0;
            else
                second_counter <= second_counter + 6'd1;
        end
    end

    // update minute_counter
     always @(posedge clk or negedge rst) begin
        if (!rst) begin
            minute_counter <= 6'd0;
        end
        else if (minute) begin
            if (minute_counter == 6'd59)
                minute_counter <= 6'd0;
            else
                minute_counter <= minute_counter + 6'd1;
        end
    end

    assign second = (ms_counter == 10'd999) && (ms_pulse);
    assign minute = (second_counter == 6'd59) && (second);
    assign hour = (minute_counter == 6'd59) && (minute);
endmodule