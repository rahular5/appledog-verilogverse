## dlatch with synchronous rst

```
module dlatch_sync_rst(D, clk, rst, Q);
  input D, clk, rst;
  output reg Q;
  always@(D, clk, rst) begin
    if(clk) begin
      if(!rst)
        Q <= 1'b0;
      else
        Q <= D;
    end
    else
      Q <= Q;
  end
endmodule
```

## test bench for dlatch with synchronous rst

```
module tb();
  reg D, clk, rst;
  wire Q;
  
  dlatch_sync_rst dut (D, clk, rst, Q);
  
  initial begin
    clk = 0;
    rst = 0;
    #12 rst = 1;
    D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 0;
    #100 $finish;
  end
  
  always #5 clk <= ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
endmodule
```
## Waveform
<img width="1404" alt="Screenshot 2025-05-13 at 10 59 44 PM" src="https://github.com/user-attachments/assets/61da8e14-04da-4ead-be2e-a7834b69b292" />

## dlatch with asynchronous reset

```
module dlatch_Async_rst(D, clk, rst, Q);
  input D, clk, rst;
  output reg Q;
  always@(D, clk, rst) begin
    if(!rst)
      Q <= 1'b0;
    else
      if(clk)
        Q <= D;
  end
endmodule 
```

## testbench for dlatch with asynchronous reset

```
module dlatch_Async_rst_tb();
  reg D, clk, rst;
  wire Q;
  
  dlatch_Async_rst dut (D, clk, rst, Q);
  
  initial begin
    clk = 0;
    rst = 0;
    #12 rst = 1;
    D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 0;
    #100 $finish;
  end
  
  always #5 clk <= ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,dlatch_Async_rst_tb);
  end
  
endmodule
```
### waveform
<img width="1398" alt="Screenshot 2025-05-13 at 11 10 12 PM" src="https://github.com/user-attachments/assets/c3480f2f-5e2f-400a-8d34-5b06eea28530" />
