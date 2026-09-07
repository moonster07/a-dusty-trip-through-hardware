module datapath (
    input clk,

    input [1:0] read_addr_A,
    input [1:0] read_addr_B,

    input [1:0] write_addr,
    input write_en,

    input [1:0] op,

    input [3:0] external_data,
    input write_select,

    output [3:0] result
);

wire [3:0] data_A;
wire [3:0] data_B;
wire [3:0] alu_result;
wire [3:0] write_data;

assign write_data = write_select ? alu_result : external_data;

register_file RF (
    .clk(clk),

    .read_addr_A(read_addr_A),
    .read_addr_B(read_addr_B),

    .write_addr(write_addr),
    .write_data(write_data),
    .write_en(write_en),

    .read_data_A(data_A),
    .read_data_B(data_B)
);

alu ALU (
    .A(data_A),
    .B(data_B),
    .op(op),
    .result(alu_result)
);

assign result = alu_result;

endmodule