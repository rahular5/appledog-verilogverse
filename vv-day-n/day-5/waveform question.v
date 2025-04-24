///To generate the clk1 of 50% duty cycle and another clk2 delayed by half of clk1 duty cycle
module clk_waveform;
  reg clk1, clk2;

  initial begin
    clk1 = 0;
    clk2 = 0;
    #100 $finish;
  end

  always #5 clk1 = ~clk1; 

  always @(clk1)
    #5 clk2 = clk1;    
  

  initial begin
	$dumpfile("dump.vcd");
    $dumpvars(0,clk1,clk2);
  end

endmodule
