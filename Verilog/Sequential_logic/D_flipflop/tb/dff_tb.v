module tb_dff;
  reg clk;
  reg d;
  reg rstn;
  reg [2:0] delay;      // Random delay between d changes (0 to 7)
  integer i;
  wire q;

  // Connect testbench signals to the design ports
  dff dff0 ( .d    (d),
             .rstn (rstn),
             .clk  (clk),
             .q    (q));

  // Clock: toggles every 10 time units, so rising edges at 10, 30, 50, ...
  always #10 clk = ~clk;

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,tb_dff);

    $monitor ("[%0t] clk=%0b rstn=%0b d=%0b q=%0b", $time, clk, rstn, d, q);

    // 1. Start in reset
    clk  = 0;
    d    = 0;
    rstn = 0;

    // 2. Change d while reset is held: q must stay 0
    #15 d <= 1;

    // 3. Release reset at t=25, between clock edges
    #10 rstn <= 1;

    // 4. Change d after random delays; d is 1 bit, so it takes bit 0 of i
    for (i = 0; i < 5; i = i + 1) begin
      delay = $random;
      #(delay) d = i;
    end

    // 5. Assert reset 5 time units after a rising edge, hold it for 10,
    //    and release it 5 time units before the next rising edge
    @(posedge clk);
    #5  rstn <= 0;
    #10 rstn <= 1;

    #30 $finish;
  end
endmodule