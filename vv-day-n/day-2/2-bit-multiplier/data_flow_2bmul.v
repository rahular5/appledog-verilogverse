// 2 bit multiplier circuit (dataflow modelling)

module mul_2bit_gl(A0, A1, A2, A3, B0, B1, B2, B3, P0, P1, P2, P3);
  
  input A0, A1, A2, A3, B0, B1, B2, B3;
  output P0, P1, P2, P3;
  wire w1, w2, w3, w4;
  
  assign P0 = A0 & B0;
  assign w1 = A1 & B0;
  assign w2 = A0 & B1;
  assign P1 = w1 ^ w2;
  assign w3 = w1 & w2;
  assign w4 = A1 & B1;
  assign P2 = w3 ^ w4;
  assign P3 = w3 & w4;
  
endmodule
  
