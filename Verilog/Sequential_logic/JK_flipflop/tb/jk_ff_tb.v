module tb;
	// Declare testbench variables
	reg j, k, rstn, clk;
	wire q; 				// Output from DUT (must be wire)
	integer i;
	reg [2:0] dly;

	// Generate clock: 50% duty cycle, 20ns period (50 MHz)
	always #10 clk = ~clk;

	// Instantiate the JK flip-flop design under test
	jk_ff u0 (
		.j(j),
		.k(k),
		.clk(clk),
		.rstn(rstn),
		.q(q)
	);

	// Stimulus generation
	initial begin
		// Initialize all inputs to zero at time 0
		{j, k, rstn, clk} <= 0;

		// Release reset after 10ns to start operation
		#10 rstn <= 1;

		// Apply random stimulus: 10 iterations
		for (i = 0; i < 10; i = i+1) begin
			dly = $random; // Random delay (0-7 ns)
			#(dly) j <= $random; // Random J input
			#(dly) k <= $random; // Random K input
		end

		// Let simulation run a bit longer, then finish
		#20 $finish;
	end

	// Monitor output changes
	initial begin
		$monitor("Time=%0t | rstn=%b j=%b k=%b q=%b",
		$time, rstn, j, k, q);
	end

	// Waveform dumping for analysis
	initial begin
		$dumpfile("jk_ff.vcd");
		$dumpvars(0, tb);
	end
endmodule