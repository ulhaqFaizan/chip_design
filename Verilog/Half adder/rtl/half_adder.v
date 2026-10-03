// half adder with continous assignment (assign)
module ha ( input 	a, b,
						output	sum, cout);

	// Sum bit: XOR gives 1 when inputs differ (1+0=1, 0+1=1)
	assign sum = a ^ b;

	// Carry bit: AND gives 1 only when both inputs are 1 (1+1=10 in binary)
	assign cout = a & b;
endmodule

// half adder with always block
module ha1 ( input 	a, b,
						output reg	sum, cout);

	// Sensitivity list: both inputs a and b
	always @ (a or b) begin
		// Concatenation {cout, sum} receives 2-bit result
		// a + b produces: cout (carry) in bit[1], sum in bit[0]
		{cout, sum} = a + b;
	end

endmodule