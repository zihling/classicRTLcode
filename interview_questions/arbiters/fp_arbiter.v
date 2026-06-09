// a fixed priority arbiter
// GNT is one-hot coded most of the time
// in this example, priority is REQ[0] > REQ[1] > REQ[2] > REQ[3]
// code comes from Cornell course ECE5745

module fixed_arbiter #(parameter NUM_REQS=4)(
    input [NUM_REQS-1:0] REQ,
    output reg [NUM_REQS-1:0] GNT
);
    wire [NUM_REQS:0] kills;
    assign kills[0] = 1'b0;
    wire [NUM_REQS-1:0] gnt_int;

    genvar i;
    generate
        for (i = 0; i < NUM_REQS; i++) begin: per_req_logic
            assign gnt_int[i] = !kills[i] & REQ[i];
            assign kills[i+1] = kills[i] | gnt_int[i];
        end
    endgenerate
    assign GNT = gnt_int;
endmodule