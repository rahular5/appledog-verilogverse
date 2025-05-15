## JK Flip Flop using FSM Approach

## state diagram
https://www.google.com/url?sa=i&url=https%3A%2F%2Fgateoverflow.in%2F3347%2Fgate-it-2008-question-37%3Fshow%3D309543&psig=AOvVaw3VON2xJqbYMlA-uLsrOH-8&ust=1747386579944000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMiqkLaQpY0DFQAAAAAdAAAAABAL![image](https://github.com/user-attachments/assets/1192883d-c198-4710-8d90-32b556799210)

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
