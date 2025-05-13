## d flip flop with synchronous reset
```
module dff_sync_rst(D, clk, rst, Q);
  input D, clk, rst;
  output reg Q;
  always@(posedge clk) begin
    if(!rst)
      Q <= 1'b0;
    else
      Q <= D;
  end
endmodule
```
## testbench for d flip flop with synchronous reset
```
module dff_sync_rst_tb();
  reg D, clk, rst;
  wire Q;
  
  dff_sync_rst dut (D, clk, rst, Q);
  
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
    $dumpvars(1,dff_sync_rst_tb);
  end
  
endmodule
```
## waveform
<img width="1398" alt="Screenshot 2025-05-13 at 11 10 12 PM" src="https://github.com/user-attachments/assets/f5d9db08-20d6-479f-b2e4-f88439c22bbe" />

