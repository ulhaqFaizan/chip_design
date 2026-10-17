module tff (
  input      clk,     // Clock
  input      rstn,    // Active-low synchronous reset
  input      t,       // Toggle enable: 1 = toggle, 0 = hold
  output reg q        // Flip-flop output
);

  always @(posedge clk) begin
    if (!rstn)        // Reset sampled at the clock edge
      q <= 0;         // Gives q a known starting value
    else if (t)
      q <= ~q;        // Toggle: next value is the inverse of the current one
    else
      q <= q;         // Hold; optional, since an unassigned reg in a
                      // clocked block keeps its value anyway
  end

endmodule