module fa (	input 	a, b, cin,
						output 	sum, cout);

	// Sum: XOR chain handles the three-input addition
	// Result is 1 when odd number of inputs are 1
	assign sum = (a ^ b) ^ cin;

	// Carry out: Generate carry when (a AND b) OR when sum of a,b generates carry with cin
	// This is the standard full adder carry equation
	assign cout = (a & b) | ((a ^ b) & cin);
endmodule