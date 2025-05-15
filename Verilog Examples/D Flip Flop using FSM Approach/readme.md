## D Flip Flop using FSM Approach

## State Diagram

<img width="695" alt="Screenshot 2025-05-15 at 3 39 30 PM" src="https://github.com/user-attachments/assets/efad538d-c7eb-4d78-8ff1-515889b3460b" />

```
module d_ff_fsm_approach(D, clk, rst, Q);
  input D, clk, rst;
  output reg Q;
  reg ns, ps;
  
  
  always@(posedge clk) begin
    if(!rst)
      ps <= 1'b0;
    else
      ps <= ns;
  end
  
  always@(*) begin
    ns = D;
    Q = ps;
  end
  
endmodule
```

## Testbench

```
module tb();
  reg D, clk, rst;
  wire Q;
  
  d_ff_fsm_approach dut (D, clk, rst, Q);
  
  initial begin
    clk = 0;
    rst = 0;
    #20 rst = 1;
    D = 1'b0;
    #20 D = 1'b0;
    #20 D = 1'b1;
    #20 D = 1'b1;
    #20 D = 1'b0;
    #20 D = 1'b1;
    #20 D = 1'b1;
    #20 D = 1'b0;
    #20 D = 1'b1;
    #20 D = 1'b1;
    #20 D = 1'b0;
    #20 D = 1'b1;
    #20 D = 1'b1;
    #100 $finish;
  end
  
  always #5 clk <= ~clk;
  
  initial begin
    $monitor(" time:%0t | D:%0d | Q:%0d ",$time,D,Q);
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
  
endmodule
```

## Output
```
 time:60 | D:1 | Q:0 
 time:65 | D:1 | Q:1 
 time:100 | D:0 | Q:1 
 time:105 | D:0 | Q:0 
 time:120 | D:1 | Q:0 
 time:125 | D:1 | Q:1 
 time:160 | D:0 | Q:1 
 time:165 | D:0 | Q:0
```

 
 ## Waveform
 
 <img width="1401" alt="Screenshot 2025-05-15 at 3 44 36 PM" src="https://github.com/user-attachments/assets/69c9e315-3eac-44ac-b2ae-82caad1a8760" />


