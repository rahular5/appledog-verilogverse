## 0 -> 2 -> 3 -> 7 counter using FSM approach (Melay)
```
module counter_fsm_0237(clk, rst, count);
  input clk, rst;
  output reg [2:0] count;
  reg [2:0] ps,ns;
  
  
  parameter s0 = 2'b00;
  parameter s1 = 2'b01;
  parameter s2 = 2'b10;
  parameter s3 = 2'b11;
  
  always @(posedge clk) begin
    if(rst)
      ps <= s0;
    else
      ps <= ns;
  end
  
  always @(ps) begin
    case(ps)
      s0 : begin
        count = 3'd0;
        ns = s1;
      end
      
      s1 : begin
        count = 3'd2;
        ns = s2;
      end
      
      s2 : begin
        count = 3'd3;
        ns = s3;
      end
      
      s3 : begin
        count = 3'd7;
        ns = s0;
      end
      
      default : begin
        count = 3'd0;
        ns = s0;
      end
    endcase
    
  end
endmodule
```
## Testbench
```
module counter_fsm_0237_test();
	reg clk,rst;
	wire [2:0] count;;
  
  counter_fsm_0237 dut (clk, rst, count);



	initial begin
	clk= 0;
	rst= 1;
	#12 rst= 0;
      #200 $finish();
	end

	always #5 clk= ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,counter_fsm_0237_test);
  end
  

endmodule
```
## WaveForm
<img width="1402" alt="Screenshot 2025-05-14 at 10 59 12 PM" src="https://github.com/user-attachments/assets/ef2fa544-1f1a-4b44-a328-10ab81449035" />
