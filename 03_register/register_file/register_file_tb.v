`timescale 1ns/1ps

module registers_tb;

reg clk;
reg write_en;
reg [1:0] write_addr;
reg [3:0] write_data;

reg [1:0] read_addr;
wire [3:0] read_data;

registers uut (
    .clk(clk),
    .write_en(write_en),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_addr(read_addr),
    .read_data(read_data)
);

always begin
    #5 clk = ~clk;
end

initial begin

    $dumpfile("registers.vcd");
    $dumpvars(0, registers_tb);

    clk = 0;
    write_en = 0;
    write_addr = 0;
    write_data = 0;
    read_addr = 0;

    // Write 1010 to R1
    write_en = 1;
    write_addr = 2'b01;
    write_data = 4'b1010;

    #10;

    // Stop writing and read R1
    write_en = 0;
    read_addr = 2'b01;

    #5;

    $display("R1 = %b", read_data);

    // Write 1100 to R2
    write_en = 1;
    write_addr = 2'b10;
    write_data = 4'b1100;

    #10;

    // Stop writing and read R2
    write_en = 0;
    read_addr = 2'b10;

    #5;

    $display("R2 = %b", read_data);

    $finish;

end

endmodule

