# Verilog code for  positive edge triggered tff with synchronous reset.
```
module tff(clk,rst,T,Q);
  input clk,rst,T;
  output reg Q;
  reg temp;
  
  always @ (posedge clk) begin
    if (rst)
        temp <= 0;
      else
        if (T)
          temp <= ~temp;
      else
        temp <= temp;
    Q <= temp;
  end
endmodule
```
# Testbench for  positive edge triggered tff with synchronous reset. 
```
module tff_test;
  reg clk,rst,T;
  wire Q;
  tff dut(clk,rst,T,Q);
  initial begin
    clk = 0;
    rst = 1;
    #12 rst = 0;
    T = 0;
    #8  T = 0;   // At 20 ns -> no toggle
    #10 T = 1;   // At 30 ns -> toggle
    #10 T = 0;   // At 40 ns -> hold
    #10 T = 1;   // At 50 ns -> toggle
    #10 T = 0;   // At 60 ns -> hold
    #10 T = 0;   // At 70 ns -> hold
    #10 T = 1;   // At 80 ns -> toggle
    #100 $finish;
  end
  
  always
    #5 clk <= ~clk;
  
  initial begin
    $dumpfile("Dump.vcd");
    $dumpvars(0,clk,rst,T,Q);
  end
  
endmodule
 ```   
    

# testbench waveform
<img width="1435" alt="Screenshot 2025-04-24 at 7 37 23 AM" src="https://github.com/user-attachments/assets/3a950b4f-766c-4074-8809-4f7a2c700e7d" />

    #8  T = 0;   // At 20 ns -> no toggle
    #10 T = 1;   // At 30 ns -> toggle
    #10 T = 0;   // At 40 ns -> hold
    #10 T = 1;   // At 50 ns -> toggle
    #10 T = 0;   // At 60 ns -> hold
    #10 T = 0;   // At 70 ns -> hold
    #10 T = 1;   // At 80 ns -> toggle
