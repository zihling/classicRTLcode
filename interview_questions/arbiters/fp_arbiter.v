// a fixed priority arbiter
// GNT is one-hot coded most of the time
// in this example, priority is REQ[3] > REQ[2] > REQ[1] > REQ[0]

module fp_arbiter (
    input clk,
    input rst_n,
    input [3:0] REQ,
    output reg [3:0] GNT
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            GNT <= 4'b0000;
        else if (REQ[3])
            GNT <= 4'b1000;
        else if (REQ[2])
            GNT <= 4'b0100;
        else if (REQ[1])
            GNT <= 4'b0010;
        else if (REQ[0])
            GNT <= 4'b0001;
        else
            GNT <= 4'b0000;
    end
endmodule