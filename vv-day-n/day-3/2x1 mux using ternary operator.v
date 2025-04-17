module mux2x1_ter_operator (I, S, Y);
  
  input [1:0] I;
  input S;
  output Y;
  
  assign Y = (S == 1'b0) ? I[0] : I[1];
  
endmodule
