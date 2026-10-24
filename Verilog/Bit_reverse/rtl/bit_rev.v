module bit_rev #(parameter N = 8;) (
    input [N-1:0] in,
    output [N-1:0] out
);

integer i;

for (i= 0; i < N; i= i + 1) begin
    assign out[i] = in[N-1-i];
end

endmodule