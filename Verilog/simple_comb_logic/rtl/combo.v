module combo ( 	input 	a, b, c, d, e,
								output 	z);

	// Continuous assignment: output changes immediately when inputs change
	// Implements: z = ((a AND b) OR (c XOR d)) AND (NOT e)
	// Synthesizes to AND, OR, XOR, and NOT gates
	assign z = ((a & b) | (c ^ d) & ~e);

endmodule