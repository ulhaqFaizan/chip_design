module mux_2x1 (input 	a, b, sel,
								output 	c);

	// Ternary operator: sel ? true_value : false_value
	// When sel=1, output c gets input a
	// When sel=0, output c gets input b
	// Synthesizes to a 2:1 mux gate or equivalent logic
	assign c = sel ? a : b;
endmodule