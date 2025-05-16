## 4x16 Decoder using 2x4 Decoder
```
module decoder_2x4(I, Y, en);
  input [1:0]I;
  input en;
  output [3:0]Y;
  
  assign Y = { (en & ~I[0] & ~I[1]) , (en & I[0] & ~I[1]) , (en & ~I[0] & I[1]) , (en & I[0] & I[1]) };
  
endmodule

module decoder_4x16(I, Y, en);
  input [3:0]I;
  input en;
  output [15:0]Y;
  wire [3:0] en_wire;
  
  decoder_2x4 decoder1 (I[3:2], en_wire, 1'b1);
  decoder_2x4 decoder2 (I[1:0], Y[3:0], en_wire[0]);
  decoder_2x4 decoder3 (I[1:0], Y[7:4], en_wire[1]);
  decoder_2x4 decoder4 (I[1:0], Y[11:8], en_wire[2]);
  decoder_2x4 decoder5 (I[1:0], Y[15:12], en_wire[3]);
  
endmodule
```
## Teastbench
```
module test;
  reg [3:0] I;
  reg en;
  wire [15:0] Y;

  decoder_4x16 DUT (I , Y , en);

  integer i;
  initial begin
    en = 1;
    for (i = 0; i < 16; i = i + 1) begin
      I = i;
      #10 $display("I = %d, Y = %b", I, Y);
    end
  end
endmodule
```
## Output
```
I =  0, Y = 1000000000000000
I =  1, Y = 0100000000000000
I =  2, Y = 0010000000000000
I =  3, Y = 0001000000000000
I =  4, Y = 0000100000000000
I =  5, Y = 0000010000000000
I =  6, Y = 0000001000000000
I =  7, Y = 0000000100000000
I =  8, Y = 0000000010000000
I =  9, Y = 0000000001000000
I = 10, Y = 0000000000100000
I = 11, Y = 0000000000010000
I = 12, Y = 0000000000001000
I = 13, Y = 0000000000000100
I = 14, Y = 0000000000000010
I = 15, Y = 0000000000000001
```
