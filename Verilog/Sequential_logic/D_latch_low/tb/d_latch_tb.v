module tb_latch;
   // Testbench regs drive the design inputs; a wire collects the output
   reg d;
   reg en;
   reg rstn;
   reg [2:0] delay;     // Random delay before each d change (0 to 7)
   reg [1:0] delay2;    // Random delay before each en toggle (0 to 3)
   integer i;
   wire q;

   // Instantiate the design and connect its ports to testbench signals
   d_latch_low  dl0 ( .d (d),
                  .en (en),
                  .rstn (rstn),
                  .q (q));

   initial begin

    $dumpfile("waveform.vcd");
    $dumpvars (0,tb_latch);

      // Print a line whenever en, d or q changes
      $monitor ("[%0t] en=%0b d=%0b q=%0b", $time, en, d, q);

      // 1. Start with reset asserted and the latch closed
      d <= 0;
      en <= 0;
      rstn <= 0;

      // 2. Release reset after 10 time units
      #10 rstn <= 1;

      // 3. Toggle en and change d after random delays
      //    d is 1 bit wide, so d <= i keeps only bit 0 of i
      for (i = 0; i < 5; i=i+1) begin
         delay = $random;
         delay2 = $random;
         #(delay2) en <= ~en;
         #(delay) d <= i;
      end
   end
endmodule