module registers (
    input clk,
    input write_en,
    input [1:0] write_addr,
    input [3:0] write_data,
    input [1:0] read_addr,
    output [3:0] read_data
);
reg [3:0] registers [0:3];


always @(posedge clk)
begin
    if (write_en)
        registers[write_addr] <= write_data;
end

assign read_data = registers[read_addr];

endmodule