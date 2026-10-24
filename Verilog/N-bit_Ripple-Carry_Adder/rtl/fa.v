module fa (input a, b, cin,
           output reg sum, cout);
  always @ (a or b or cin)
  {cout, sum} = a + b + cin;

    initial
      $display ("Full adder instantiation");
endmodule