module rca #(
    parameter N=8
) (
    input [N-1:0] a, b,
    input cin, 
    output [N-1:0] sum,
    output cout
);

genvar i;
wire [N:0] c;
assign c[0] = cin;
assign cout = c[N];

generate
    
    for (i = 0; i < N ; i= i+1) begin : gen_u0
        fa u0(.a(a[i]), .b(b[i]), .cin(c[i]), .sum(sum[i]), .cout(c[i+1]));
    end
endgenerate
    
endmodule