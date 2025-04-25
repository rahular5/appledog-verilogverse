# Verilog code for 3 bit up down counter
```
module up_down_counter(clk,rst,count,ctrl);
  
  input clk;
  input rst;
  input ctrl;
  output reg [2:0] count;
  reg [2:0] temp;

  always @(posedge clk) begin
    if (rst)
      temp <= 2'b000;
    else begin
      if (ctrl)
        temp <= temp + 1;
      else
        temp <= temp - 1;
    end
  end
    
  assign count = temp;

endmodule
```
# Verification of 3 bit up down counter.
```
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
```

# waveform

<img width="1436" alt="Screenshot 2025-04-25 at 11 48 35 AM" src="https://github.com/user-attachments/assets/bd6d259c-36cb-4257-ad6d-da893c6a15ce" />
