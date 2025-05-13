## t latch with synchronous reset 
```
module tlatch_sync_rst(T, clk, rst, Q);
  input T, clk, rst;
  output reg Q;
  reg temp;
  
  always@(T, clk, rst) begin
    if(clk) begin
      if(!rst)
        temp <= 1'b0;
      else begin
        if (T)
          temp <= ~temp;
        else
          temp <= temp;
      end
    end
    Q <= temp;
  end
    
    
endmodule
```
## testbech for t latch with synchronous reset 
```
module tlatch_sync_rst_tb();
  reg T, clk, rst;
  wire Q;
  
  tlatch_sync_rst dut (T, clk, rst, Q);
  
  initial begin
    clk = 0;
    rst = 0;
    #12 rst = 1;
    T = 0;
    #12 T = 1;
    #13 T = 0;
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
    $dumpvars(1,tlatch_sync_rst_tb);
  end
  
endmodule
```
## waveform
<img width="1400" alt="Screenshot 2025-05-13 at 11 43 47 PM" src="https://github.com/user-attachments/assets/f73d35c5-d354-41a5-8598-2ee0bea2a78e" />

## t latch with Asynchronous reset 
```
module tlatch_Async_rst(T, clk, rst, Q);
  input T, clk, rst;
  output reg Q;
  reg temp;
  
  always@(T, clk, rst) begin
    if (rst)
      temp <= 1'b0;
    else begin
      if (clk) begin
        if (T)
          temp <= ~temp;
        else
          temp <= temp;
      end
      else
        temp <= Q;
    end
    Q <= temp;
  end
endmodule
```
## testbench for t latch with Asynchronous reset 
```
module tlatch_Async_rst_tb();
  reg T, clk, rst;
  wire Q;
  
  tlatch_Async_rst dut (T, clk, rst, Q);
  
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
    $dumpvars(1,tlatch_Async_rst_tb);
  end
  
endmodule
```
## waveform
<img width="1403" alt="Screenshot 2025-05-14 at 12 09 59 AM" src="https://github.com/user-attachments/assets/ab6d645a-f8b3-4bcc-90ae-14ea362e3306" />

