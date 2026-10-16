// Modulo-10 Counter: Counts from 0 to 9, then rolls over
module mod10_counter (
	input clk, // Clock input
	input rstn, // Synchronous active-low reset
	output reg [3:0] out // 4-bit output (0-9, needs 4 bits)
);

	// Sequential logic: triggered on rising clock edge only
	always @ (posedge clk) begin
		if (!rstn) begin
			// Synchronous reset: counter resets to 0 on next clock edge
			// (Unlike asynchronous reset, this waits for clock edge)
			out <= 0;
		end else begin
			// Counter logic
			if (out == 9) // Check if reached maximum count
				out <= 0; // Roll over to 0
			else
				out <= out + 1; // Increment counter
		end
	end
endmodule