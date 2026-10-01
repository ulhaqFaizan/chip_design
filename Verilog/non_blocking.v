module tb;
  reg [7:0] a, b, c, d, e;

  initial begin
    a <= 8'hDA;                                           // Schedule assignment to 'a' for end of time-step
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // 'a' not updated yet!
    b <= 8'hF1;                                           // Schedule assignment to 'b' for end of time-step
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // 'a', 'b' not updated yet!
    c <= 8'h30;                                           // Schedule assignment to 'c' for end of time-step
    $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  // None updated yet!
  end                                                     // End of time-step: Now a, b, c get their values

  initial begin
    d <= 8'hAA;                                           // Schedule assignment to 'd'
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);      // 'd' not updated yet!
    e <= 8'h55;                                           // Schedule assignment to 'e'
    $display ("[%0t] d=0x%0h e=0x%0h", $time, d, e);      // 'd', 'e' not updated yet!
  end                                                     // End of time-step: Now d, e get their values
  initial begin   
  #10  
  $display ("[%0t] a=0x%0h b=0x%0h c=0x%0h", $time, a, b, c);  
  $display("[%0t] d=0x%0h e=0x%0h", $time, d, e);
  end
endmodule