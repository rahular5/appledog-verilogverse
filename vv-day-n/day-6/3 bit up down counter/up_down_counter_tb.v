// Verification of 3 bit up down counter.

module test;
  
  reg clk,rst,ctrl;
  reg [2:0]count;
  
  up_down_counter dut (clk,rst,count,ctrl);
  
  initial begin
    clk = 0;
    rst = 1;
    ctrl = 0;
    #50 rst = 0; 
    #50 ctrl = 1;
    #50 ctrl = 0;
    #50 ctrl = 1;
    #50 ctrl = 1;
    #50 ctrl = 0;
    #50 ctrl = 1;
    #1000 $finish;
  end
  
  always #5 clk =~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
