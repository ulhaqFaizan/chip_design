module (
    input clk,
    input [3:0] d,
    input rst,
    input en,
    output reg [4:0] q

);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q <= 4'hA;
    else if(en) begin
        q <= d;
    end
    end

end

endmodule