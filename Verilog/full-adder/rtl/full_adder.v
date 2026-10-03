module fa (	input 	a, b, cin,
						output 	sum, cout);

	// Sum: XOR chain handles the three-input addition
	// Result is 1 when odd number of inputs are 1
	assign sum = (a ^ b) ^ cin;

	// Carry out: Generate carry when (a AND b) OR when sum of a,b generates carry with cin
	// This is the standard full adder carry equation
	assign cout = (a & b) | ((a ^ b) & cin);
endmodule

// full adder with always block 
module fa1 (	input 	a, b, cin,
			output reg	sum, cout);

 // All THREE inputs in sensitivity list
 always @ (a or b or cin) begin
 	// Three input addition: a + b + cin
 	// Result is 2 bits: cout (bit[1]) and sum (bit[0])
 {cout, sum} = a + b + cin;
 end

endmodule