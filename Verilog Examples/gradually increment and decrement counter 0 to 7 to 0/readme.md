## Gradually increment decrement counter 0 to 7 and back to 0
```
module counter(clk,rst,count);
  
  input clk,rst;
  output [2:0]count;
  reg [2:0] temp;
  reg ctrl;
  
  assign count = temp;

  
  always@(posedge clk) begin
    if(rst) begin
      temp<=3'b000;
      ctrl<=1;
    end
    else
      if (ctrl) begin
        if (temp==3'b111) begin
          ctrl<=0;
          temp=temp-1;
        end
        else begin
          temp=temp+1;
        end
      end
    
    
    else
      if(temp==3'b000) begin
          ctrl<=1;
          temp<=temp+1;
        end
        else
          temp<=temp-1;
  end
endmodule
```
## Testbench
```
module test;
  
  reg clk,rst;
  wire[2:0]count;
  
  counter dut(clk,rst,count);
  
  initial begin
    clk = 0;
    rst = 1;
    #13 rst = 0;
    #1000 $finish;
  end
  
  always #5 clk =~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(2,test);
  end
  
endmodule
```
## waveform
![image](https://github.com/user-attachments/assets/4200736d-5117-4313-8ddc-3dfb97c11e06)
