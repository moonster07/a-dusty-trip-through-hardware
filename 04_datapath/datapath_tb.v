`timescale 1ns/1ps

module datapath_tb;

reg clk;
reg [1:0] read_addr_A;
reg [1:0] read_addr_B;
reg [1:0] write_addr;
reg write_en;
reg [1:0] op;
reg [3:0] external_data;
reg write_select;

wire [3:0] result;

datapath uut (
    .clk(clk),
    .read_addr_A(read_addr_A),
    .read_addr_B(read_addr_B),
    .write_addr(write_addr),
    .write_en(write_en),
    .op(op),
    .external_data(external_data),
    .write_select(write_select),
    .result(result)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("datapath.vcd");
    $dumpvars(0, datapath_tb);

    write_en = 0;
    write_addr = 0;
    external_data = 0;
    write_select = 0;
    read_addr_A = 0;
    read_addr_B = 0;
    op = 0;
    write_en = 1;
    write_addr = 2'b01;
    external_data = 4'b0101;
    write_select = 0;

    #10;

    write_addr = 2'b10;
    external_data = 4'b0011;
    write_select = 0;
    write_en = 1;

    #10;

    write_en = 0;
    read_addr_A = 2'b01;
    read_addr_B = 2'b10;
    op = 2'b00;

    #10;

    write_addr = 2'b11;
    write_select=1;
    write_en = 1;

    #10;

    $display("Result = %b", result);
    $finish;
end

endmodule