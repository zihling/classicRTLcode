// round robin arbiter with kill chain
module variable_priority_arbiter #(parameter  NUM_REQS=4) (
    input [NUM_REQS-1:0] REQ,
    input [NUM_REQS-1:0] prio, // one hot input of variable priority
    output [NUM_REQS-1:0] GNT
);
    wire [2*NUM_REQS:0] kills;
    wire [2*NUM_REQS-1:0] priority_int = {{NUM_REQS{1'b0}}, prio}; // extend priority
    wire [2*NUM_REQS-1:0] req_int = {REQ, REQ};
    wire [2*NUM_REQS-1:0] gnt_int;

    assign kills[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 2*NUM_REQS; i++) begin: per_req_logic
            assign gnt_int[i] = priority_int[i]? req_int[i] : (~kills[i] & req_int[i]);
            assign kills[i+1] = priority_int[i]? gnt_int[i] : (kills[i] | gnt_int[i]); 
        end
    endgenerate
    assign GNT = gnt_int[NUM_REQS-1:0] | gnt_int[2*NUM_REQS-1:NUM_REQS];
endmodule


module rr_arbiter #(parameter  NUM_REQS=4, parameter RESET_PRIORITY=1) (
    input clk,
    input rst_n,
    input [NUM_REQS-1:0] REQ,
    output [NUM_REQS-1:0] GNT
);
    wire priority_en = |GNT; // if there is a request, then we should always update priority
    wire [NUM_REQS-1:0] priority_next;

    assign priority_next = {GNT[NUM_REQS-2:0], GNT[NUM_REQS-1]};
    
    reg [NUM_REQS-1:0] priority_;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            priority_ <= RESET_PRIORITY;
        else if (priority_en)
            priority_ <= priority_next;
    end

    //instantiate variable arbiter
    variable_priority_arbiter #(NUM_REQS) va (.REQ(REQ), .prio(priority_), .GNT(GNT));
endmodule