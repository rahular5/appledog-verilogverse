///Generate 2 clock each of 10ns time period and 50 percent duty. Clk2 is delayed version of clock 1 by 5 ns.
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


//generate a clock of 20 ns time period with 40 percent duty cycle
module clkgeneration;
  reg clk;
  initial begin
    clk = 0;
    #500 $finish;
  end
  
  always begin
    #8 clk = 1;
    #12 clk = 0;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,clk);
  end
endmodule
  
