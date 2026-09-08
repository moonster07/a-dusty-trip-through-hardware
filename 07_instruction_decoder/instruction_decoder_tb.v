`timescale 1ns/1ps

module instruction_decoder_tb;

reg [7:0] instruction;

wire [1:0] opcode;
wire [1:0] rd;
wire [1:0] rs1;
wire [1:0] rs2;

instruction_decoder uut(
    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2)


);

initial begin
    $dumpfile("instruction_decoder.vcd");
    $dumpvars(0, instruction_decoder_tb);

    instruction=8'b00110110; //add r3,r1,r2;
    #10;

    instruction=8'b01101101; //sub r2,r3,r1;
    #10;

    instruction=8'b10011011; //and r1,r2,r3;
    #10;

    instruction=8'b11000110; //or r0,r1,r2;
    #10;

    $finish;
end
endmodule


