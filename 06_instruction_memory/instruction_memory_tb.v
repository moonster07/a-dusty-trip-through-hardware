`timescale 1ns/1ps

module instruction_memory_tb;

reg [7:0] address;
wire [7:0] instruction_out;

instruction_memory uut(
    .address(address),
    .instruction(instruction_out)

);

initial begin 
    $dumpfile("instruction_memory.vcd"); 
    $dumpvars(0, instruction_memory_tb);
    
    address=0;
    #10;

    address=1;
    #10;

    address=2;
    #10;

    address=3;
    #10;

    address=4;
    #10;

    address=5;
    #10;
    
    address=6;
    #10;

    address=7;
    #10;

    $finish;

end

endmodule

