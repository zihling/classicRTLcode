// a dual port RAM with 256 entries, support simultaneous read and write operations

module RAM (
    input clk, 
    input rst, 
    input write, 
    input [7:0] write_address, 
    input [7:0] write_data, 
    input read, 
    input[7:0] read_address, 
    output [7:0] read_data); 


endmodule