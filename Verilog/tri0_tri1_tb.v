module tb;
    tri0 		tri0_net;
    tri1 		tri1_net;

    wire normal_net;

    reg 		driver_1;
    reg 		driver_2;
    reg [3:0] values;

    assign tri0_net = driver_1;
    assign tri0_net = driver_2;

    assign tri1_net = driver_1;
    assign tri1_net = driver_2;

    assign normal_net = driver_1;
    assign normal_net = driver_2;

    initial
        $monitor("[%0t] driver_1=%0b driver_2=%0b normal=%0b tri0=%0b tri1=%0b", $time, driver_1, driver_2, normal_net, tri0_net, tri1_net);

        initial begin
        values = {1'bZ, 1'bX, 1'b1, 1'b0};

        for (integer i = 0; i < 4; i+=1) begin
            for (integer j = 0; j < 4; j+=1) begin

                driver_1 = values[i];
                driver_2 = values[j];
                #10;
            end
        end
    end
endmodule