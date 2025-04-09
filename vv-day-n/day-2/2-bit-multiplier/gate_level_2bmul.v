// 2 bit multiplier circuit (gate level modelling)

module mul_2bit_gl(A0, A1, A2, A3, B0, B1, B2, B3, P0, P1, P2, P3);
  
  input A0, A1, A2, A3, B0, B1, B2, B3;
  output P0, P1, P2, P3;
  wire w1, w2, w3, w4;
  
  and a1 (P0, A0, B0);
  and a2 (w1, A1, B0);
  and a3 (w2, A0, B1);
  xor x1 (P1, w1, w2);
  and a4 (w3, w1, w2);
  and a5 (w4, A1, B1);
  xor x2 (P2, w3, w4);
  and a6 (P3, w3, w4);
  
endmodule
  
