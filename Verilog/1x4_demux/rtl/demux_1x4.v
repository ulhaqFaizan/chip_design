module demux_1x4 (	input f,
					input [1:0] sel,
					output a, b, c, d);

	// Output a is active when sel = 2'b00
	assign a = f & ~sel[1] & ~sel[0];

	// Output b is active when sel = 2'b10
	assign b = f & sel[1] & ~sel[0];

	// Output c is active when sel = 2'b01
	assign c = f & ~sel[1] & sel[0];

	// Output d is active when sel = 2'b11
	assign d = f & sel[1] & sel[0];

endmodule