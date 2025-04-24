// Testbench for  positive edge triggered tff with asynchronous reset. 

module tff_test;
  reg clk,rst,T;
  wire Q;
  tff dut(clk,rst,T,Q);
  initial begin
    clk = 0;
    rst = 1;  // Apply async reset at start
    T = 0;

    #3  rst = 0;   // Deassert reset before first clock edge

    #7  T = 1;     // At 10 ns rising edge → Q toggles
    #10 T = 0;     // At 20 ns → Q holds
    #10 T = 1;     // At 30 ns → Q toggles

    #6  rst = 1;   // Assert async reset (before clk edge)
    #4  rst = 0;   // Deassert reset (at 40 ns)

    #6  T = 1;     // At 45 ns rising edge → Q toggles
    #10 T = 0;     // At 55 ns → Q holds

    #20 $finish;
  end

  
  always
    #5 clk <= ~clk;
  
  initial begin
    $dumpfile("Dump.vcd");
    $dumpvars(0,clk,rst,T,Q);
  end
  
endmodule
    
    
