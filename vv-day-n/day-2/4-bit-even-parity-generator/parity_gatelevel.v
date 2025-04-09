// 4 bit even parity generator circuit (gate level modelling)

module even_parity(b0, b1, b2, b3, P);
  
  input b0, b1, b2, b3;
  output P;
  
  xor x1 (P, b0, b1, b2, b3);
  
endmodule
  
