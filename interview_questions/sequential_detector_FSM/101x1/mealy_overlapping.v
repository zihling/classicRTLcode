// a sequence detector that can detect sequence 101x1
// Mealy FSM, overlapping

// Mealy FSM
module sequence_detector (
    input clk,
    input rstn,
    input d,
    output out
);
    reg [2:0] state, state_next;
    parameter S0=3'd0, S1=3'd1, S2=3'd2, S3=3'd3, S4=3'd4, S5=3'd5;

    /*
    S4 matched 1010
    S5 matched 1011
    */

    // state transition
    always @(*) begin
        case (state)
            S0: state_next = d? S1:S0;
            S1: state_next = d? S1:S2;
            S2: state_next = d? S3:S0;
            S3: state_next = d? S5:S4;
            S4: state_next = d? S3:S0;
            S5: state_next = d? S1:S2;
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
    assign out = ((state == S4) && (d == 1'b1)) || ((state == S5) && (d == 1'b1));
endmodule