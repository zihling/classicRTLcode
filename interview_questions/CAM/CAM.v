// CAM is a type of RAM

module simple_cam #(
    parameter DEPTH  = 8,
    parameter KEY_W  = 8,
    parameter ADDR_W = 3
)(
    input clk,
    input rst_n,

    input write_en,
    input [ADDR_W-1:0] write_addr,
    input [KEY_W-1:0] write_key,

    input search_en,
    input [KEY_W-1:0] search_key,

    output reg match,
    output reg [ADDR_W-1:0] match_addr
);

    reg [KEY_W-1:0] cam_mem [0:DEPTH-1];
    reg valid [0:DEPTH-1]; // indicate whether a key is a valid key or just NULL

    integer i;

    always @(posedge clk or negedge rst_n) begin
        // TODO: modify this code to make CAM forbids repeating keys in different address (check before write)
        if (!rst_n) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                valid[i] <= 1'b0;
                cam_mem[i] <= {KEY_W{1'b0}};
            end
        end
        else begin
            if (write_en) begin
                cam_mem[write_addr] <= write_key;
                valid[write_addr] <= 1'b1;
            end
        end
    end

    always @(*) begin
        match = 1'b0;
        match_addr = {ADDR_W{1'b0}};

        if (search_en) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                if (valid[i] && cam_mem[i] == search_key && !match) begin
                    match = 1'b1;
                    match_addr = i[ADDR_W-1:0];
                end
            end
        end
    end

endmodule