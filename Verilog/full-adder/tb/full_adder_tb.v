module tb;

    // declare all inputs
    reg a, b, cin;

    // delare all outputs
    wire sum, cout;

    integer i; 

    // full adder instancee
    fa u0 (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        // create waveform
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb);

        // inilize inputs
        a = 0;
        b = 0;
        cin = 0;
        
        $monitor("a=%0b b=%0b cin=%0b sum=%0b cout=%0b", a, b, cin, sum, cout);

        // test all input possibilities
        for(i=0; i<8; i++) begin
            {a,b,cin} = i;
            #10;
        end
    end

endmodule