`timescale 1ns/1ps

module register_tb;

reg [3:0] data;
reg clk;

wire [3:0] q;

register uut (
    .data(data),
    .clk(clk),
    .q(q)
);

always begin
    #5 clk = ~clk;
end

initial begin

    $dumpfile("register.vcd");
    $dumpvars(0, register_tb);

    clk = 0;

    data = 4'b0101;
    #10;

    data = 4'b1010;
    #10;

    $finish;

end

endmodule