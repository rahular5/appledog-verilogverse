// Verification of mod-10 counter.

module test;
  
  reg clk,rst;
  reg [3:0]count;
  
  async_low_rst_counter dut (clk,rst,count);
  
  initial begin
    clk = 0;
    rst = 1;
    #13 rst = 0;
    #1000 $finish;
  end
  
  always #5 clk =~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
