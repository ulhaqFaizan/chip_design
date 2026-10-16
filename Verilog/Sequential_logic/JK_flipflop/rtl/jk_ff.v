module jk_ff (
    input rstn,
    input j,
    input k,
    input clk,
    output reg q
);

always @(posedge clk or negedge rstn) begin
    if (!rstn) 
        q <= 0;
    
    else begin
        case ({j,k})
            2'b01: q <= 0;
            2'b10: q <= 1;
            2'b11: q <= ~q;
            default: ;
        endcase
    end
end

endmodule