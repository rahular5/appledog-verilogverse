// 2 input xor gate using nand gate only (data flow modelling)

module xor_using_nand_df(A,B,Y);
  input A, B;
  output Y;
  wire w1, w2, w3;
  assign w1 = ~(A & B);
  assign w2 = ~(A & w1);
  assign w3 = ~(B & w1);
  assign Y = ~(w2 & w3);
endmodule
