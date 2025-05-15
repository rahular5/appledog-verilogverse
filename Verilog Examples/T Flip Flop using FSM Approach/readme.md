## T Flip Flop using FSM Approach
## State diagram
<img width="793" alt="Screenshot 2025-05-15 at 4 02 01 PM" src="https://github.com/user-attachments/assets/f0b57958-37d1-43a9-8f29-3ec8f0549e24" />

```
module t_ff_fsm_approach(T, clk, rst, Q);
  input T, clk, rst;
  output reg Q;
  reg ns, ps;
  
  
  always@(posedge clk) begin
    if(!rst)
      ps <= 1'b0;
    else
      ps <= ns;
  end
  
  always@(*) begin
    case(T)
      1'b0 : ns = ps;
      1'b1 : ns = ~ps;
      default : ns = ps;
    endcase
    Q = ps;
  end
endmodule

```

## Test bench
```
module tb();
  reg T, clk, rst;
  wire Q;
  
  t_ff_fsm_approach dut (T, clk, rst, Q);
  
  initial begin
    clk = 0;
    rst = 0;
    #20 rst = 1;
    T = 1'b0;
    #10 T = 1'b0;
    #10 T = 1'b1;
    #10 T = 1'b1;
    #10 T = 1'b0;
    #10 T = 1'b1;
    #10 T = 1'b1;
    #10 T = 1'b0;
    #10 T = 1'b1;
    #10 $finish;
  end
  
  always #5 clk <= ~clk;
  
  initial begin
    $monitor(" time:%0t | T:%0d | Q:%0d ",$time,T,Q);
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
  
endmodule
```
## Output

```
 time:0 | T:x | Q:x 
 time:5 | T:x | Q:0 
 time:20 | T:0 | Q:0 
 time:40 | T:1 | Q:0 
 time:45 | T:1 | Q:1 
 time:55 | T:1 | Q:0 
 time:60 | T:0 | Q:0 
 time:70 | T:1 | Q:0 
 time:75 | T:1 | Q:1 
 time:85 | T:1 | Q:0 
 time:90 | T:0 | Q:0
```

## WaveForm

<img width="1402" alt="Screenshot 2025-05-15 at 4 02 27 PM" src="https://github.com/user-attachments/assets/889494c4-1d23-45e3-b2b3-36e694098607" />
