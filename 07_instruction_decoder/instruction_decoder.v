module instruction_decoder(
    input [7:0] instruction,

    output [1:0] opcode,
    output [1:0] rd,
    output [1:0] rs1,
    output [1:0] rs2
    
);

assign opcode=instruction[7:6];
assign rd=instruction[5:4];
assign rs1=instruction[3:2];
assign rs2=instruction[1:0];

endmodule