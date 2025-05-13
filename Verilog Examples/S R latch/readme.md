## S R Latch with synchronous reset
```
module sr_latch_sync_rst(S, R, clk, rst, Q);
  input S, R, clk, rst;
  output reg Q;
  reg temp;
  
  always @(S, R, clk, rst) begin
    if(clk) begin
      if(rst)
        temp <= 1'b0;
      else begin
        if (S==0 && R==0)
          temp <= Q;
        else if (S==0 && R==1)
          temp <= 1'b0;
        else if (S==1 && R==0)
          temp <= 1'b1;
        else
          temp <= 1'bx;
      end
    end
    Q <= temp;
  end
  
endmodule
```
## Testbench for S R Latch with synchronous reset
```
module sr_latch_sync_rst_tb();
  reg S, R, clk, rst;
  wire Q;
  
  sr_latch_sync_rst dut (S, R, clk, rst, Q);
  
  initial begin
    clk = 0;
    rst = 1;
    S = 0; R = 0;
    #12 rst = 0;
    #12 S = 0; R = 0;
    #12 S = 0; R = 1;
    #12 S = 1; R = 0;
    #12 S = 1; R = 1;
    #100 $finish;
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,sr_latch_sync_rst_tb);
  end
  
endmodule
```
## Waveform
<img width="1401" alt="Screenshot 2025-05-14 at 12 51 34 AM" src="https://github.com/user-attachments/assets/3e1722d7-5646-433c-9281-52f63f7f9fc8" />

