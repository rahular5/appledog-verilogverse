## JK Flip Flop using FSM Approach

## state diagram
![image](https://github.com/user-attachments/assets/6ec96c98-1c5c-48a6-9a76-c0176870d5b6)


```
module jk_ff_fsm_approach(J, K, clk, rst, Q);
  
  input J, K, clk, rst;
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
    case(ps)
      
      S0:begin
        case({J, K})
          2'b00 : ns = S0;
          2'b01 : ns = S0;
          2'b10 : ns = S1;
          2'b11 : ns = S1;
        endcase
        Q = 1'b0;
      end
      
      S1:begin
        case({J, K})
          2'b00 : ns = S1;
          2'b01 : ns = S0;
          2'b10 : ns = S1;
          2'b11 : ns = S0;
        endcase
        Q = 1'b1;
      end
      
      default:begin
        ps = S0;
        Q = 1'b0;
      end
      
    endcase
    
  end
  
endmodule
```
## Testbench
```
module tb();
  reg J, K, clk, rst;
  wire Q;
  
  jk_ff_fsm_approach dut (J, K, clk, rst, Q);
  
  initial begin
    clk = 0;
    rst = 0;
    #20 rst = 1;
    {J, K} = 2'b00;
    #20 {J, K} = 2'b01;
    #20 {J, K} = 2'b10;
    #20 {J, K} = 2'b11;
    #100 $finish;
  end
  
  always #5 clk <= ~clk;
  
  initial begin
    $monitor(" time:%0t | J:%0d | K:%0d | Q:%0d ",$time,J,K,Q);
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
  
endmodule
```
## WaveForm
<img width="1399" alt="Screenshot 2025-05-15 at 2 40 55 PM" src="https://github.com/user-attachments/assets/68055371-1be5-4bb3-b433-4b329517026e" />
