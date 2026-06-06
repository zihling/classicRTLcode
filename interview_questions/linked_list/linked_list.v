// TODO: check and understand this

module hw_linked_list_fifo #(
    parameter DEPTH = 16,
    parameter DATA_W = 8,
    parameter PTR_W = 4
)(
    input clk,
    input rst_n,

    input push,
    input [DATA_W-1:0] push_data,

    input pop,
    output reg [DATA_W-1:0] pop_data,

    output empty,
    output full
);

localparam NULL = {PTR_W{1'b1}};

reg [DATA_W-1:0] data_mem [0:DEPTH-1]; // memory to store data
reg [PTR_W-1:0]  next_mem [0:DEPTH-1]; // memory to stor next pointer

reg [PTR_W-1:0] head; // current head of list
reg [PTR_W-1:0] tail; // current tail of list
reg [PTR_W-1:0] free_head;

reg [PTR_W:0] count;

assign empty = (count == 0);
assign full  = (count == DEPTH);

integer i;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        head <= NULL;
        tail <= NULL;
        free_head <= 0;
        count <= 0;

        for (i = 0; i < DEPTH-1; i = i + 1)
            next_mem[i] <= i + 1;

        next_mem[DEPTH-1] <= NULL;
    end
    else begin
        // push only
        if (push && !full && !(pop && !empty)) begin
            data_mem[free_head] <= push_data;

            if (empty) begin
                head <= free_head;
                tail <= free_head;
                free_head <= next_mem[free_head];
                next_mem[free_head] <= NULL;
            end
            else begin
                next_mem[tail] <= free_head;
                tail <= free_head;
                free_head <= next_mem[free_head];
                next_mem[free_head] <= NULL;
            end

            count <= count + 1;
        end

        // pop only
        else if (pop && !empty && !(push && !full)) begin
            pop_data <= data_mem[head];

            head <= next_mem[head];

            next_mem[head] <= free_head;
            free_head <= head;

            if (count == 1)
                tail <= NULL;

            count <= count - 1;
        end
    end
end

endmodule