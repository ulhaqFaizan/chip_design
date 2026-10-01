module tb;
  reg [7:0] a, b, c, d, e;

  initial begin
    a = 8'hDA;                                            // Execute at time 0
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);
    #10 b = 8'hF1;                                        // Wait 10ns, then execute
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // Execute at time 10
    c = 8'h30;                                            // Execute immediately after b
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // Still at time 10
  end

  initial begin
    #5 d = 8'hAA;                                         // Wait 5ns, then execute
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);      // Execute at time 5
    #5 e = 8'h55;                                         // Wait another 5ns (total 10ns)
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);      // Execute at time 10
  end
endmodule