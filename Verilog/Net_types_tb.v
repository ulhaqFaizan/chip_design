module tb;
  wor  		wor_net;
  wand 		wand_net;
  trior 	trior_net;
  triand 	triand_net;

  wire      normal_net;

  reg 		driver_1;
  reg 		driver_2;
  reg [3:0] values;

  assign wor_net = driver_1;
  assign wor_net = driver_2;

  assign trior_net = driver_1;
  assign trior_net = driver_2;

  assign wand_net = driver_1;
  assign wand_net = driver_2;

  assign triand_net = driver_1;
  assign triand_net = driver_2;

  assign normal_net = driver_1;
  assign normal_net = driver_2;

  initial
      $monitor("[%0t] driver_1=%0b driver_2=%0b normal=%0b wor=%0b wand=%0b trior=%0b triand=%0b", $time, driver_1, driver_2, normal_net, wor_net, wand_net, trior_net, triand_net);

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