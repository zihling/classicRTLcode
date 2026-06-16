// a dual port RAM with 256 entries, support simultaneous read and write operations

module RAM (
    input clk, 
    input rst, 
    input write, 
    input [7:0] write_address, 
    input [7:0] write_data, 
    input read, 
    input[7:0] read_address, 
    output reg [7:0] read_data); 

    reg [7:0] mem [255:0];

    // read
    always @(posedge clk or negedge rst) begin
        if (!rst)
            read_data <= 0;
        else if (read)
            read_data <= mem[read_address];
    end

    // write
    always @(posedge clk) begin
        if (write)
            mem[write_address] <= write_data;
    end

endmodule