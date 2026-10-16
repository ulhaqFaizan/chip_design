module tb;
	reg clk, rstn;
	wire [3:0] out; // Counter output (wire, not reg)

	// Instantiate the modulo-10 counter
	mod10_counter u0 (
		.clk(clk),
		.rstn(rstn),
		.out(out)
	);

	// Generate clock: 20ns period
	always #10 clk = ~clk;

	// Stimulus
	initial begin
		// Initialize signals
		{clk, rstn} <= 0;

		// Release reset after 10ns
		#10 rstn <= 1;

        #55 rstn <= 0;

        #10 rstn <= 1;

		// Let counter run for multiple cycles to observe rollover
		#450 $finish;
	end

	// Display counter value at each change
	initial begin
		$monitor("Time=%0t | rstn=%b out=%0d", $time, rstn, out);
	end

	// Waveform dump
	initial begin
		$dumpfile("waveform.vcd");
		$dumpvars(0, tb);
	end
endmodule