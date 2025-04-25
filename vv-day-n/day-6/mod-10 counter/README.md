
# Design of mod-10 counter
```
module async_low_rst_counter(clk,rst,count);
  
  input clk;
  input rst;         
  output reg [3:0] count;
  reg [3:0] temp;

  always @(posedge clk) begin
    if (rst)
      temp <= 4'b0000;
    else begin
      if (temp == 4'b1010)
        temp <= 4'b0000;
      else
        temp <= temp + 1;
    end
  end
    
  assign count = temp;

endmodule
```
# Verification of mod-10 counter.
```
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
```

<img width="1432" alt="Screenshot 2025-04-25 at 11 29 28 AM" src="https://github.com/user-attachments/assets/b3db86ac-732e-4244-a09b-99fde0e65b7b" />
