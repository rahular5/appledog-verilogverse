## Dut for 3 bit up-down counter using FSM approach
```
module counter_ud(clk, rst, ctrl, count);
  input clk, rst, ctrl;
  output reg [2:0] count;
  reg [2:0] ps,ns;
  
  parameter s0 = 3'b000;
  parameter s1 = 3'b001;
  parameter s2 = 3'b010;
  parameter s3 = 3'b011;
  parameter s4 = 3'b100;
  parameter s5 = 3'b101;
  parameter s6 = 3'b110;
  parameter s7 = 3'b111;
  
  always @(posedge clk) begin
    if(rst)
      ps <= s0;
    else
      ps <= ns;
  end
  
  always @(ps,ctrl) begin
    case(ps)
    s0: if(ctrl) begin
      ns= s1;
      count = 3'd1;
    end
    else begin
      ns= s7;
      count = 3'd7;
    end
    
    s1: if(ctrl) begin
      ns= s2;
      count = 3'd2;
    end
    else begin
      ns= s0;
      count = 3'd0;
    end
    
    s2: if(ctrl) begin
      ns= s3;
      count = 3'd3;
    end
    else begin
      ns= s1;
      count = 3'd1;
    end
    
    s3: if(ctrl) begin
      ns= s4;
      count = 3'd4;
    end
    else begin
      ns= s2;
      count = 3'd2;
    end
    
    s4: if(ctrl) begin
      ns= s5;
      count = 3'd5;
    end
    else begin
      ns= s3;
      count = 3'd3;
    end
    
    s5: if(ctrl) begin
      ns= s6;
      count = 3'd6;
    end
    else begin
      ns= s4;
      count = 3'd4;
    end
    
    s6: if(ctrl) begin
      ns= s7;
      count = 3'd7;
    end
    else begin
      ns= s5;
      count = 3'd5;
    end
    
    s7: if(ctrl) begin
      ns= s0;
      count = 3'd0;
    end
    else begin
      ns= s6;
      count = 3'd6;
    end
    
    default : begin
      ns = 3'd0;
      count = 3'd0;
    end
      
    endcase
  end
endmodule
```
## Testbench for 3 bit up-down counter using FSM approach
```
module tb_counter_ud;

  reg clk, rst, ctrl;
  wire [2:0] count;


  counter_ud dut (clk, rst, ctrl, count);


  always #5 clk = ~clk;

  initial begin
  
    clk = 0;
    rst = 1;
    ctrl = 1;


    #10 rst = 0;

    ctrl = 1;
    #100;

    ctrl = 0;
    #110;

    ctrl = 1;
    #100;

    $finish;
  end

  initial begin
    $display("Time\tclk\trst\tctrl\tcount");
    $monitor("%0t\t%b\t%b\t%b\t%d", $time, clk, rst, ctrl, count);
  end


  initial begin
    $dumpfile("dump.vcd");         
    $dumpvars(1,tb_counter_ud); 
  end

endmodule
```
## Waveform
<img width="1397" alt="Screenshot 2025-05-14 at 10 53 30 PM" src="https://github.com/user-attachments/assets/b37cdeb3-0feb-414c-ae88-62d0a0b68829" />

