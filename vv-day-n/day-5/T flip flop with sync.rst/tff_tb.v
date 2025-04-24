// Testbench for  positive edge triggered tff with synchronous reset. 

module tff_test;
  reg clk,rst,T;
  wire Q;
  tff dut(clk,rst,T,Q);
  initial begin
    clk = 0;
    rst = 1;
    #12 rst = 0;
    T = 0;
    #8  T = 0;   // At 20 ns -> no toggle
    #10 T = 1;   // At 30 ns -> toggle
    #10 T = 0;   // At 40 ns -> hold
    #10 T = 1;   // At 50 ns -> toggle
    #10 T = 0;   // At 60 ns -> hold
    #10 T = 0;   // At 70 ns -> hold
    #10 T = 1;   // At 80 ns -> toggle
    #100 $finish;
  end
  
  always
    #5 clk <= ~clk;
  
  initial begin
    $dumpfile("Dump.vcd");
    $dumpvars(0,clk,rst,T,Q);
  end
  
endmodule
    
    
