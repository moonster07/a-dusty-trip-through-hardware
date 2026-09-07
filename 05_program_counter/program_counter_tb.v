`timescale 1ns/1ps

module program_counter_tb;

reg clk;
reg reset;

wire [7:0] pc;

program_counter uut (
    .clk(clk),
    .reset(reset),
    .pc(pc)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("program_counter.vcd");
    $dumpvars(0, program_counter_tb);

    reset = 1;

    #10;
    reset = 0;

    #2800;

    $finish;
end

endmodule