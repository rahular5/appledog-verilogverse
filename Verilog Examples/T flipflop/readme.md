## t flip flop with synchronous reset 
```
module tff_sync_rst(T, clk, rst, Q);
  input T, clk, rst;
  output reg Q;
  reg temp;
  
  always@(posedge clk) begin
    if (rst)
      temp <= 1'b0;
    else begin
      if (T)
        temp <= ~temp;
      else
        temp <= temp;
    end
    Q <= temp;
    
  end
    
endmodule
```
## testbench for t flip flop with synchronous reset 
```
module tff_sync_rst_tb();
  reg T, clk, rst;
  wire Q;
  
  tff_sync_rst dut (T, clk, rst, Q);
  
  initial begin
    clk = 0;
    rst = 1;
    #12 rst = 0;
    T = 0;
    #12 T = 1;
    #12 T = 0;
    #12 T = 1;
    #12 T = 0;
    #12 T = 0;
    #12 T = 1;
    #12 T = 0;
    #12 T = 1;
    #12 T = 0;
    #12 T = 0;
    #200 $finish;
  end
  
  always #5 clk <= ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tff_sync_rst_tb);
  end
  
endmodule
```
## waveform
<img width="1401" alt="Screenshot 2025-05-14 at 12 19 07 AM" src="https://github.com/user-attachments/assets/741c472e-0ff3-4a58-a779-f9f0647d090f" />

## t flip flop with Asynchronous reset 
```
module tff_Async_rst(T, clk, rst, Q);
  input T, clk, rst;
  output reg Q;
  reg temp;
  
  always@(posedge clk or posedge rst) begin
    if (rst)
      temp <= 1'b0;
    else begin
      if (T)
        temp <= ~temp;
      else
        temp <= temp;
    end
    Q <= temp;
    
  end
    
endmodule
```
## testbench for t flip flop with Asynchronous reset 
```
module tff_Async_rst_tb();
  reg T, clk, rst;
  wire Q;
  
  tff_Async_rst dut (T, clk, rst, Q);
  
  initial begin
    clk = 0;
    rst = 1;
    #12 rst = 0;
    T = 0;
    #12 T = 1;
    #12 T = 0;
    #12 T = 1;
    #12 T = 0;
    #12 T = 0;
    #12 T = 1;
    #12 T = 0;
    #12 T = 1;
    #12 T = 0;
    #12 T = 0;
    #200 $finish;
  end
  
  always #5 clk <= ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tff_Async_rst_tb);
  end
  
endmodule
```
## waveform
<img width="1398" alt="Screenshot 2025-05-14 at 12 22 27 AM" src="https://github.com/user-attachments/assets/4faff1e3-4805-4f15-a6e0-3aa2f5f07b68" />

