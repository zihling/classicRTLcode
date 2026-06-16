// a sequence detector that can detect sequence 101x1
// Moore FSM, overlapping

// Moore FSM
module sequence_detector (
    input clk,
    input rstn,
    input d,
    output out
);
    reg [2:0] state, state_next;
    parameter S0=3'd0, S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4, S5=3'd5, S6A=3'd6, S6B=3'd7;

    /*
    S4 matched 1010
    S5 matched 1011
    S6A detected 10101
    S6B detected 10111
    */

    // state transition
    always @(*) begin
        case (state)
            S0: state_next = d? S1:S0;
            S1: state_next = d? S1:S2;
            S2: state_next = d? S3:S0;
            S3: state_next = d? S5:S4;
            S4: state_next = d? S6A:S0;
            S5: state_next = d? S6B:S2;
            S6A: state_next = d? S1:S4;
            S6B: state_next = d? S1:S2;
            default: state_next = S0;
        endcase
    end
    // sequential block
    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            state <= S0;
        else
            state <= state_next; 
    end
    assign out = (state == S6A) || (state == S6B);
endmodule