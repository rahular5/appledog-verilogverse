## Question : Design a single State Transition Diagram (STD) for a Mealy-based sequence detector that detects overlapping occurrences of the following binary sequences: a) 01011 b) 11001 c) 1100

```
module  mealy_based_sequence_detector(in_seq, clk, rst, det_out);
  input in_seq, clk, rst;
  output reg det_out;
  
  reg [3:0] ps, ns;
  
  parameter idle = 4'b0000;
  parameter S0 = 4'b0001;
  parameter S1 = 4'b0010;
  parameter S01 = 4'b0011;
  parameter S010 = 4'b0100;
  parameter S0101 = 4'b0101;
  parameter S11 = 4'b0110;
  parameter S110 = 4'b0111;
  parameter S1100 = 4'b1000;
  
  always @(posedge clk) begin
    if (rst)
      ps <= idle;
    else 
      ps <= ns;
  end
  
  always @(in_seq, ps) begin
    
    case(ps)
      
      idle : begin
        if(in_seq) begin
          ns <= S1;
          det_out <= 0;
        end
        else begin
          ns <= S0;
          det_out <= 0;
        end
      end
      
      S0 : begin
        if(in_seq) begin
          ns <= S01;
          det_out <= 0;
        end
        else begin
          ns <= S0;
          det_out <= 0;
        end
      end
      
      S01 : begin
        if(in_seq) begin
          ns <= S11;
          det_out <= 0;
        end
        else begin
          ns <= S010;
          det_out <= 0;
        end
      end
      
      S010 : begin
        if(in_seq) begin
          ns <= S0101;
          det_out <= 0;
        end
        else begin
          ns <= S0;
          det_out <= 0;
        end
      end
      
      S0101 : begin
        if(in_seq) begin
          ns <= S11;
          det_out <= 1;
        end
        else begin
          ns <= S0;
          det_out <= 0;
        end
      end
      
      S1 : begin
        if(in_seq) begin
          ns <= S11;
          det_out <= 0;
        end
        else begin
          ns <= idle;
          det_out <= 0;
        end
      end
      
      S11 : begin
        if(in_seq) begin
          ns <= S11;
          det_out <= 0;
        end
        else begin
          ns <= S110;
          det_out <= 0;
        end
      end
      
      S110 : begin
        if(in_seq) begin
          ns <= S1;
          det_out <= 0;
        end
        else begin
          ns <= S1100;
          det_out <= 1;
        end
      end
      
      S1100 : begin
        if(in_seq) begin
          ns <= S1;
          det_out <= 1;
        end
        else begin
          ns <= S0;
          det_out <= 0;
        end
      end
          
    endcase
    
  end
  
endmodule
```
## Testbench
```
module tb;
  reg in_seq, clk, rst;
  wire det_out;
  
  mealy_based_sequence_detector dut (in_seq, clk, rst, det_out);
  
  always #5 clk <= ~clk;
  
  initial begin
    rst = 1;
    clk = 0;
    #10 rst = 0;
    #10 in_seq = 0;
    #10 in_seq = 1;
    #10 in_seq = 0;
    #10 in_seq = 1;
    #10 in_seq = 1;
    #10 in_seq = 1;
    #10 in_seq = 1;
    #10 in_seq = 0;
    #10 in_seq = 0;
    #10 in_seq = 1;
    #50 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    $monitor("time : %0t : rst : %0b | in_seq : %0b | det_out : %0b",$time ,rst, in_seq, det_out);
  end
  
endmodule
```

## Output

```
time : 0 : rst   : 1 | in_seq : x | det_out : x
time : 5 : rst   : 1 | in_seq : x | det_out : 0
time : 10 : rst  : 0 | in_seq : x | det_out : 0
time : 20 : rst  : 0 | in_seq : 0 | det_out : 0
time : 30 : rst  : 0 | in_seq : 1 | det_out : 0
time : 40 : rst  : 0 | in_seq : 0 | det_out : 0
time : 50 : rst  : 0 | in_seq : 1 | det_out : 0
time : 55 : rst  : 0 | in_seq : 1 | det_out : 1
time : 65 : rst  : 0 | in_seq : 1 | det_out : 0
time : 90 : rst  : 0 | in_seq : 0 | det_out : 0
time : 95 : rst  : 0 | in_seq : 0 | det_out : 1
time : 105 : rst : 0 | in_seq : 0 | det_out : 0
time : 110 : rst : 0 | in_seq : 1 | det_out : 1
time : 115 : rst : 0 | in_seq : 1 | det_out : 0
```
## Waveform
<img width="1401" alt="Screenshot 2025-05-17 at 3 21 04 PM" src="https://github.com/user-attachments/assets/69186cf4-2e08-448d-9182-076a9879c2be" />
