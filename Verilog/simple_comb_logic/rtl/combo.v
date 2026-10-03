// combinational logic with continuous assignment (assign)
module combo ( 	input 	a, b, c, d, e,
								output 	z);

	// Continuous assignment: output changes immediately when inputs change
	// Implements: z = ((a AND b) OR (c XOR d)) AND (NOT e)
	// Synthesizes to AND, OR, XOR, and NOT gates
	assign z = ((a & b) | (c ^ d) & ~e);

endmodule

// combinational logic with always block
module combo1 ( 	input 	a, b, c, d, e,
								output 	reg z);

	// Sensitivity list contains ALL inputs
	// Logic updates whenever any input changes
	always @ ( a or b or c or d or e) begin
		// Blocking assignment (=) for combinational logic
		// Implements: z = (a AND b) OR ((c XOR d) AND (NOT e))
		z = ((a & b) | (c ^ d) & ~e);
	end

endmodule