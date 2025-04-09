// 2x1 mux using nand primitive only (gate level modelling)

module mux2_1 (I0, I1, S, Y);
  
  input I0, I1, S;
  output Y;
  
  wire w1, w2, w3;
  nand n1 (w1, s);
  nand n2 (w3, S, I1);
  nand n3 (w2, w1, I0);
  nand n4 (Y, w2, w3);
  
endmodule
