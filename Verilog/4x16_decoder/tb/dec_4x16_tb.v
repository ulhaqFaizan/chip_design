module tb;
	reg en; // Enable signal
	reg [3:0] in; // 4-bit input (16 possible values)
	wire [15:0] out; // 16-bit output (one-hot encoded)
	integer i;

	dec_4x16 u0 ( .en(en), .in(in), .out(out));

	initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb);

		en = 0;
		in = 0;

		$monitor("en=%0b in=0x%0h out=0x%0h", en, in, out);

		// Test all 32 combinations (enable + 16 input values)
		for (i = 0; i < 32; i = i + 1) begin
			{en, in} = i;
			#10;
		end
	end
endmodule