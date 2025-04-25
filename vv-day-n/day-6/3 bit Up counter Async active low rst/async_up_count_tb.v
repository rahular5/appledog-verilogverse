module test;
  
  reg clk,rst;
  wire[2:0]count;
  
  async_low_rst_counter dut (clk,rst,count);
  
  initial begin
    clk = 0;
    rst = 0;
    #13 rst = 1;
    #1000 $finish;
  end
  
  always #5 clk =~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
