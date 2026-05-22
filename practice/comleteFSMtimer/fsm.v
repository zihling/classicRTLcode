// HDLBits/Building Larger Circuits/fsm

module fsm (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    parameter S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4, S5 = 3'd5, S6 = 3'd6;
    reg [2:0] state, next_state;
    reg [1:0] counter;

    always @(*) begin
        case (state)
            S0: next_state = data? S1:S0;
            S1: next_state = data? S2:S0;
            S2: next_state = data? S2:S3;
            S3: next_state = data? S4:S0;
            S4: next_state = S4;
            S5: next_state = (done_counting)? S6:S5;
            S6: next_state = ack? S0:S6;
            default: next_state = S0;
        endcase
    end 

    always @(posedge clk) begin
        if (reset) begin
            state <= S0;
            counter <= 2'd0;
        end
        else begin
            if (state == S4) begin
                if (counter == 2'b11) begin
                    state <= S5;
                    counter <= 2'b00;
                end
                else begin
                    state <= next_state;
                    counter <= counter + 2'd1;
                end
            end
            else
                state <= next_state;
        end
            
    end

    assign shift_ena = (state == S4);
    assign counting = (state == S5);
    assign done = (state == S6);

endmodule
