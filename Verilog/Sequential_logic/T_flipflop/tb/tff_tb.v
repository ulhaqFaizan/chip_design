module tb;
  reg        clk;
  reg        rstn;
  reg        t;
  reg  [4:0] dly;     // Delay between t changes, picked once (0 to 31)
  integer    i;
  wire       q;

  tff u0 ( .clk  (clk),
           .rstn (rstn),
           .t    (t),
           .q    (q));

  // Clock: period of 10, rising edges at 5, 15, 25, ...
  always #5 clk = ~clk;

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,tb);

    
    dly = $random;              // One random delay, reused for every step
    {rstn, clk, t} <= 0;        // Start in reset with t = 0

    $monitor ("T=%0t rstn=%0b t=%0d q=%0d", $time, rstn, t, q);

    // Hold reset for two rising edges, then release it
    repeat(2) @(posedge clk);
    rstn <= 1;

    // Drive a random t every dly time units
    for (i = 0; i < 20; i = i + 1)
      #(dly) t <= $random;      // t is 1 bit, so it takes bit 0

    #20 $finish;
  end
endmodule