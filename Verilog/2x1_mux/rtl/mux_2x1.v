// Mux with continuous assignment (assign)
module mux_2x1 (input 	a, b, sel,
				output 	c);

	// Ternary operator: sel ? true_value : false_value
	// When sel=1, output c gets input a
	// When sel=0, output c gets input b
	// Synthesizes to a 2:1 mux gate or equivalent logic
	assign c = sel ? a : b;
endmodule

// Mux with always block
module mux1_2x1 (input 	a, b, sel,
				output 	reg c);

 // All inputs in sensitivity list
 always @ ( a or b or sel) begin
 	// Ternary operator: condition ? true_value : false_value
 	// If sel=1, output c = a; if sel=0, output c = b
	c = sel ? a : b;
 end
endmodule