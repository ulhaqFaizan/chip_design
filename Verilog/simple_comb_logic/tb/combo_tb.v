module tb;
	// Declare testbench variables
	reg a, b, c, d, e, a1, b1, c1, d1, e1; // Use 'reg' for variables you assign in procedural blocks
	wire z, z1; // Use 'wire' for outputs from modules under test
	integer i;

	// Instantiate the design and connect design inputs/outputs with
	// testbench variables
	combo u0 ( .a(a), .b(b), .c(c), .d(d), .e(e), .z(z));

	combo1 u1 ( .a(a1), .b(b1), .c(c1), .d(d1), .e(e1), .z(z1));

	initial begin
        // Create waveform file
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb);
        
		// At the beginning of time, initialize all inputs of the design
		// to a known value, in this case we have chosen it to be 0.
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		e = 0;
		a1 = 0;
		b1 = 0;
		c1 = 0;
		d1 = 0;
		e1 = 0;

		// Use a $monitor task to print any change in the signal to
		// simulation console
		$monitor("a=%0b b=%0b c=%0b d=%0b e=%0b z=%0b | a1=%0b b1=%0b c1=%0b d1=%0b e1=%0b z1=%0b",
         a, b, c, d, e, z,
         a1, b1, c1, d1, e1, z1);

		// Because there are 5 inputs, there can be 32 different input combinations
		// So use an iterator "i" to increment from 0 to 32 and assign the value
		// to testbench variables so that it drives the design inputs
		for (i = 0; i < 32; i = i + 1) begin
			{a, b, c, d, e} = i; // Concatenation assigns bits from i to inputs
			{a1, b1, c1, d1, e1} = i;
			#10; // Wait 10 time units between test vectors
		end
		// finish simulation
		$finish;
	end
endmodule