module tb;
 reg clk, rstn, d;
 wire [3:0] out;
 integer i;

 // Instantiate the 4-bit left shift register
 lshift_4b_reg u0 (
 .d(d),
 .clk(clk),
 .rstn(rstn),
 .out(out)
 );

 // Generate clock
 always #10 clk = ~clk;

 // Stimulus
 initial begin
 // Initialize all signals
 {clk, rstn, d} <= 0;

 // Release reset
 #10 rstn <= 1;

 // Shift in 20 random bits, synchronized to clock edge
 for (i = 0; i < 20; i=i+1) begin
 @(posedge clk) d <= $random; // Apply new bit at clock edge
 end

 // Wait a bit and finish
 #10 $finish;
 end

 // Monitor shift register value
 initial begin
 $monitor("Time=%0t | d=%b out=%b", $time, d, out);
 end

 // Waveform dump
 initial begin
 $dumpfile("waveform.vcd");
 $dumpvars(0, tb);
 end
endmodule