// 4 bit even parity generator circuit (dataflow modelling)

module even_parity_df(b0, b1, b2, b3, P);
  
  input b0, b1, b2, b3;
  output P;
  
  assign P = ( b0 ^ b1 ^ b2 ^ b3 );
  
endmodule
  
