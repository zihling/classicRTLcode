// a Moore FSM

module Moore_detector (
    input clk,
    input aresetn,
    input x,
    output z
    );

    reg [2:0] state, next_state;
    parameter S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4, S5 = 3'd5;
    
    always @(*) begin
        case (state)
            S0: next_state = x? S1:S0;
            S1: next_state = x? S1:S2;
            S2: next_state = x? S3:S0;
            S3: next_state = x? S4:S2;
            S4: next_state = x? S1:S5;
            S5: next_state = x? S1:S0;
            default: next_state = S0;
        endcase
    end

    always @(posedge clk or negedge aresetn) begin
        if (!aresetn)
            state <= S0;
        else
            state <= next_state;
    end

    assign z = (state == S5);
endmodule