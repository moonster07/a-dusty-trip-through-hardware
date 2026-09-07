module program_counter (
    input clk,
    input reset,
    output reg [7:0] pc
);

always @(posedge clk) begin
    if (reset)
        pc <= 8'b0;
    else
        pc <= pc + 1;
end

endmodule
