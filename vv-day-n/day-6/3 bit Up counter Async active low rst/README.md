# 3 bit Up counter with Asynchronous active low reset
```
module async_low_rst_counter(clk,rst,count);
  input clk;
  input rst;         
  output reg [2:0] count;
  reg [2:0] temp;

  always @(posedge clk) begin
    if (!rst)
      temp <= 3'b000;
    else
      temp <= temp + 1;
  end
  assign count = temp;

endmodule
```
# 3 bit Up counter with Asynchronous active low reset testbench
```
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
```
 ![image](https://github.com/user-attachments/assets/50c74381-869a-4737-8279-d3d6598c12ed)
