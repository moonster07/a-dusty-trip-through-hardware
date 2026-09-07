module register_file (
    input clk,

    input [1:0] read_addr_A,
    input [1:0] read_addr_B,

    input [1:0] write_addr,
    input [3:0] write_data,
    input write_en,

    output [3:0] read_data_A,
    output [3:0] read_data_B
);

reg [3:0] registers [0:3];

always @(posedge clk)
begin
    if (write_en)
        registers[write_addr] <= write_data;
end

assign read_data_A = registers[read_addr_A];
assign read_data_B = registers[read_addr_B];

endmodule
