// HDLBits/Building Larger Circuits/fsmshift

module fsmshift (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    parameter S0 = 1'b0, S1 = 1'b1;
    reg state;
    reg [1:0] counter;

    always @(posedge clk) begin
        if (reset) begin
            state <= S1;
            counter <= 2'd0;
        end
        else begin
            case (state)
                S0: state <= S0;
                S1: begin
                    counter <= counter + 2'd1;
                    if (counter == 2'd3)
                        state <= S0;
                    else
                        state <= S1;
                end
            endcase
        end
        
    end

	assign shift_ena = (state == S1);
endmodule