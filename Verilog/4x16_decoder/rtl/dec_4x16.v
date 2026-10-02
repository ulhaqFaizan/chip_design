module dec_4x16 (   input en,
				    input [3:0] in,
					output [15:0] out);

	// When enabled, shift 1 left by 'in' positions to activate one output bit
	// Example: in=3 produces out=16'b0000_0000_0000_1000 (bit 3 set)
	// When disabled (en=0), all outputs are 0
	assign out = en ? 1 << in : 0;
endmodule