`timescale 1ns/1ns

module sale(
   input                clk   ,
   input                rst_n ,
   input                sel   ,//sel=0,5$dranks,sel=1,10&=$drinks
   input          [1:0] din   ,//din=1,input 5$,din=2,input 10$
 
   output   reg  [1:0] drinks_out,//drinks_out=1,output 5$ drinks,drinks_out=2,output 10$ drinks
   output	reg        change_out   
);
    reg state, next_state;
    parameter S0 = 1'b0, S5 = 1'b1;

    always @(*) begin
        case (state)
            S0: begin
                if (din == 2'd0)
                    next_state = S0;
                else if (sel == 1'b0)
                    next_state = S0;
                else begin
                    if (din == 2'd1)
                        next_state = S5;
                    else if (din == 2'd2)
                        next_state = S0;
                end
            end
            S5: begin
                if (din == 2'd0)
                    next_state = S5;
                else
                    next_state = S0; 
            end
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= S0;
        else
            state <= next_state;
    end

    always @(posedge clk or negedge rst_n) begin
        drinks_out <= 2'd0;
        change_out <= 1'b0;
        case (state)
            S0: begin
                if (sel == 1'b0) begin // buy $5 drink
                    if (din == 2'd1) begin
                        drinks_out <= 2'd1;
                        change_out <= 1'b0;
                    end
                    else if (din == 2'd2) begin
                        drinks_out <= 2'd1;
                        change_out <= 1'b1;
                    end
                end
                else if (sel == 1'b1) begin // buy $10 drink
                    if (din == 2'd2) begin
                        drinks_out <= 2'd2;
                        change_out <= 1'b0;
                    end
                end
            end
            S5: begin
                if (din == 2'd1) begin
                    drinks_out <= 2'd2;
                    change_out <= 1'b0;
                end
                else if (din == 2'd2) begin
                    drinks_out <= 2'd2;
                    change_out <= 1'b1;
                end 
            end
        endcase
    end 
endmodule