module instruction_memory(
    input [7:0] address,
    output [7:0] instruction 
);

reg [7:0] memory [0:7];

initial begin
    memory[0] = 8'b00010001;
    memory[1] = 8'b00100010;
    memory[2] = 8'b00110011;
    memory[3] = 8'b01000100;
    memory[4] = 8'b01010101;
    memory[5] = 8'b01100110;
    memory[6] = 8'b01110111;
    memory[7] = 8'b10001000;
end

assign instruction = memory[address];


endmodule