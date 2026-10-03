module tb;

    // declare all inputs
    reg a, b, cin, a1, b1, cin1;

    // delare all outputs
    wire sum, cout, sum1, cout1;

    integer i; 

    // full adder instancee
    fa u0 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    fa1 u1 (.a(a1), .b(b1), .cin(cin1), .sum(sum1), .cout(cout1));

    initial begin
        // create waveform
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb);

        // inilize inputs
        a = 0;
        b = 0;
        cin = 0;
        a1 = 0;
        b1 = 0;
        cin1 = 0;
        
        $monitor("a=%0b b=%0b cin=%0b sum=%0b cout=%0b | a1=%0b b1=%0b cin1=%0b sum1=%0b cout1=%0b",
         a, b, cin, sum, cout, a1, b1, cin1, sum1, cout1);

        // test all input possibilities
        for(i=0; i<8; i++) begin
            {a,b,cin} = i;
            {a1,b1,cin1} = i;
            #10;
        end
    end

endmodule