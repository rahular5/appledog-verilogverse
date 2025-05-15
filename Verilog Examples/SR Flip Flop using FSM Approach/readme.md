## State diagram
<img width="772" alt="Screenshot 2025-05-15 at 3 14 50 PM" src="https://github.com/user-attachments/assets/c01a3ce5-7bed-4696-902d-426e039438d2" />

## SR Flip Flop using FSM Approach

```
module sr_ff_fsm_approach(S, R, clk, rst, Q);
  input S, R, clk, rst;
  output reg Q;
  reg ns, ps;
  
  parameter S0 = 1'b0;
  parameter S1 = 1'b1;
  
  always@(posedge clk) begin
    if(!rst)
      ps <= S0;
    else
      ps <= ns;
  end
  
  always@(*) begin
    case({S, R})
      2'b00 : begin
        ns = ps;
        Q = ps;
      end
      2'b01 : begin
        ns = S0;
        Q = S0;
      end
      2'b10 : begin
        ns = S1	;
        Q = S1;
      end
      2'b11 : begin
        ns = ps;
        Q = 1'bx;
      end
      default : begin
        ns = S0;
        Q = S0;
      end  
    endcase
  end
endmodule
```
## Testbench
```
module tb();
  reg S, R, clk, rst;
  wire Q;
  
  sr_ff_fsm_approach dut (S, R, clk, rst, Q);
  
  initial begin
    clk = 0;
    rst = 0;
    #20 rst = 1;
    {S, R} = 2'b00;
    #20 {S, R} = 2'b01;
    #20 {S, R} = 2'b10;
    #20 {S, R} = 2'b11;
    #100 $finish;
  end
  
  always #5 clk <= ~clk;
  
  initial begin
    $monitor(" time:%0t | S:%0d | R:%0d | Q:%0d ",$time,S,R,Q);
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
  
endmodule
```
## WaveForm

<img width="1398" alt="Screenshot 2025-05-15 at 3 15 19 PM" src="https://github.com/user-attachments/assets/6593f1d6-4a84-438f-845f-be60da04503e" />


