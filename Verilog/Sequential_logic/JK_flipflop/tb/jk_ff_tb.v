module tb_jk;
  reg        clk;
  reg        j, k;
  wire       q;
  reg        exp_q;               // Expected q from the reference model
  reg  [1:0] jk_seq [0:7];        // {j, k} pairs to apply, in order
  integer    i, errors;

  jk_ff u0 (.j(j), .k(k), .clk(clk), .q(q));

  // Clock: period of 10, rising edges at 5, 15, 25, ...
  always #5 clk = ~clk;

  initial begin
    // Stimulus sequence: start with reset, since q is x until set or reset
    jk_seq[0] = 2'b01;   // Reset:  q -> 0
    jk_seq[1] = 2'b00;   // Hold:   q stays 0
    jk_seq[2] = 2'b10;   // Set:    q -> 1
    jk_seq[3] = 2'b00;   // Hold:   q stays 1
    jk_seq[4] = 2'b11;   // Toggle: q -> 0
    jk_seq[5] = 2'b11;   // Toggle: q -> 1
    jk_seq[6] = 2'b01;   // Reset:  q -> 0
    jk_seq[7] = 2'b11;   // Toggle: q -> 1

    clk    = 0;          // Initialize clk, or ~x stays x and no edge ever occurs
    {j, k} = 2'b00;
    errors = 0;
    exp_q  = 1'bx;

    for (i = 0; i < 8; i = i + 1) begin
      @(negedge clk);             // Change inputs away from the rising edge
      {j, k} = jk_seq[i];

      @(posedge clk);             // Flip-flop samples j and k here
      #1;                         // Let q update before checking

      // Reference model, written as a lookup instead of the equation
      case ({j, k})
        2'b00 : exp_q = exp_q;
        2'b01 : exp_q = 1'b0;
        2'b10 : exp_q = 1'b1;
        2'b11 : exp_q = ~exp_q;
      endcase

      $display("[%0t] j=%b k=%b q=%b", $time, j, k, q);
      if (q !== exp_q) begin
        $display("  ERROR: expected q=%b", exp_q);
        errors = errors + 1;
      end
    end

    if (errors == 0) $display("PASS: all JK operations correct");
    else             $display("FAIL: %0d mismatches", errors);
    $finish;
  end
endmodule