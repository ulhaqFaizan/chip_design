module tb;

reg clk;
reg rstn;
wire [1:0] count;

count2 u0 (.clk(clk), .rstn(rstn), .count(count));

always #5 clk = ~clk;

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,tb);

    $monitor("clk= %0t rstn= %0b count= %0d", $time, rstn, count);

    {rstn, clk} = 0;

    #10 rstn = 1'b1;

    #200 $finish;

end



endmodule