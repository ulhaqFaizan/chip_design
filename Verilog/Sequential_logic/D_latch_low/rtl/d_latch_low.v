module d_latch_low (
    input d, 
    input rstn,
    input en,
    output reg q
);

always @(*) begin
    if (!rstn)
        q <= 0;

    else if(!en)
        q <= d;

end

endmodule