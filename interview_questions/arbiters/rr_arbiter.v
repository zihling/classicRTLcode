// a 4-bit round robin arbiter with kill chain

module rr_arbiter (
    input clk,
    input rst_n,
    input [3:0] REQ,
    output reg [3:0] GNT
);
    reg [1:0] pointer;
    reg [3:0] req_rot;
    reg [3:0] gnt_rot;
    reg [3:0] kill;

    // rotate request according to pointer (assume LSB is the highest priority)
    always @(*) begin
        case (pointer)
            2'b00: req_rot = REQ;
            2'b01: req_rot = {REQ[0], REQ[3:1]};
            2'b10: req_rot = {REQ[1:0], REQ[3:2]};
            2'b11: req_rot = {REQ[2:0], REQ[3]};
            default: req_rot <= REQ;
        endcase
    end

    // fixed priority arbiter using kill chain
    always @(*) begin
        kill[0] = 1'b0;
        gnt_rot[0] = req_rot[0] & ~kill[0];

        kill[1] = kill[0] | req_rot[0];
        gnt_rot[1] = req_rot[1] & ~kill[1];

        kill[2] = kill[1] | req_rot[1];
        gnt_rot[2] = req_rot[2] & ~kill[2];

        kill[3] = kill[2] | req_rot[2];
        gnt_rot[3] = req_rot[3] & ~kill[3];
    end

    // rotate grant back
    always @(*) begin
        case (pointer) 
            2'd0: GNT = gnt_rot;
            2'd1: GNT = {gnt_rot[2:0], gnt_rot[3]};
            2'd2: GNT = {gnt_rot[1:0], gnt_rot[3:2]};
            2'd3: GNT = {gnt_rot[0], gnt_rot[3:1]};
            default: GNT <= gnt_rot;
        endcase
    end

    // update pointer
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pointer <= 2'd0;
        end
        else begin
            case (GNT)
                4'b0001: pointer <= 2'd1;
                4'b0010: pointer <= 2'd2;
                4'b0100: pointer <= 2'd3;
                4'b1000: pointer <= 2'd0;
                default: pointer <= pointer;
            endcase
        end
    end

endmodule