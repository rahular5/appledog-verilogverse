// 2 input xor gate using nand gate only (gate level modelling)

module xor_using_nand(A,B,Y);
  input A, B;
  output Y;
  wire w1, w2, w3;
  nand A1 (w1, A, B);
  nand A2 (w2, A, w1);
  nand A3 (w3, B, w1);
  nand A4 (Y, w2 ,w3);
endmodule
