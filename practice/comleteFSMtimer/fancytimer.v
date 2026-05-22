// HDLBits/Building Larger Circuits/fancytimer

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    parameter  S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, SH1 = 4'd4, SH2 = 4'd5, SH3 = 4'd6, SH4 = 4'd7, CNT = 4'd8, DN = 4'd9;  
    reg [3:0] state, next_state;
    reg [3:0] delay;
    reg [9:0] cycle_count;

    always @(*) begin
        case (state)
            S0: next_state = data? S1:S0;
            S1: next_state = data? S2:S0;
            S2: next_state = data? S2:S3;
            S3: next_state = data? SH1:S0;
            SH1: next_state = SH2;
            SH2: next_state = SH3;
            SH3: next_state = SH4;
            SH4: next_state = CNT;
            CNT: next_state = (count == 0 && cycle_count == 10'd999)? DN:CNT;
            DN: next_state = ack? S0:DN;
            default: next_state = S0;
        endcase
    end 

    always @(posedge clk) begin
        if (reset) begin
            state <= S0;
            cycle_count <= 10'd0;
        end
        else begin
            state <= next_state;
            if (state == SH1 || state == SH2 || state == SH3 || state == SH4)
                delay <= {delay[2:0], data};
            else if (state == CNT) begin
                if (cycle_count == 10'd999) begin
                    delay <= delay - 4'd1;
                    cycle_count <= 10'd0;
                end
                else begin
                    cycle_count <= cycle_count + 10'd1;
                end
            end
        end
            
    end
    assign count = delay;
    assign counting = (state == CNT);
    assign done = (state == DN);

endmodule