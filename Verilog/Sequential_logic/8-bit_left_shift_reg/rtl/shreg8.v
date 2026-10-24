module shreg8 (
    input clk,
    input rst,
    input [7:0] d,
    input load,
    input shift,
    output reg [7:0] q
);

always @(posedge clk) begin
    if (rst)
        q <= 8'b0;
    else if (load)
        q <= d;
    else if (shift)
        q <= {q[6:0], 1'b0};
    else 
        q <= q;
end

endmodule