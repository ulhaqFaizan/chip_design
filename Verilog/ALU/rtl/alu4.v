module alu4 (
    input [3:0] a,
    input [3:0] b,
    input [1:0] op,
    output reg [3:0] result,
    output zero
);

always @(*) begin
    case (op)
        2'b00 : result = a + b;
        2'b01 : result = a - b;
        2'b10 : result = a & b;
        2'b11 : result = a | b;
        default : result = 4'h0
    endcase
end

assign zero = (result == 4'h0) ? 1'b1 : 1'b0;
    
endmodule