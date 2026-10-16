// 4-bit Left Shift Register
module lshift_4b_reg (
 input d, // Serial data input (enters at LSB)
 input clk, // Clock signal
 input rstn, // Synchronous active-low reset
 output reg [3:0] out // 4-bit parallel output
);

 // Sequential logic: shift operation on clock edge
 always @ (posedge clk) begin
 if (!rstn) begin
 // Reset: clear all bits
 out <= 0;
 end else begin
 // Left shift operation:
 // - out[3] gets out[2] (MSB shifts out, lost)
 // - out[2] gets out[1]
 // - out[1] gets out[0]
 // - out[0] gets d (new bit enters at LSB)
 // Concatenation syntax: {out[2:0], d}
 out <= {out[2:0], d};
 end
 end
endmodule