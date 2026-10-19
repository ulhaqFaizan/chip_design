module count2 (
    input clk,
    input rstn,
    output wire [1:0] count
);

wire q0, q1;

tff tff0(.clk(clk), .rstn(rstn), .t(1'b1), .q(q0));

tff tff1(.clk(clk), .rstn(rstn), .t(q0), .q(q1));

assign count = {q1, q0};

endmodule

//This is the same logic that synthesis builds from count <= count + 1.