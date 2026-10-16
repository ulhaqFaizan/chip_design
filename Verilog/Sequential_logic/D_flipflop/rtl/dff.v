module dff (
  input      d,       // Data input, captured on the rising clock edge
  input      rstn,    // Active-low asynchronous reset
  input      clk,     // Clock
  output reg q        // Registered output
);

  // Block runs on a rising clock edge OR when rstn falls (reset asserted)
  always @(posedge clk or negedge rstn)
    if (!rstn)        // Reset asserted: clear q immediately, no clock needed
      q <= 0;
    else              // Reached only on a rising clock edge with reset released
      q <= d;

endmodule