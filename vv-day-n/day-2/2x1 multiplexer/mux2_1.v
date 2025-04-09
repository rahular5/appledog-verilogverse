// Code for 2x1 mux

module mux2_1(I0,I1,s,y);
  input I0,I1,s;
  output y;
  
  assign y = ( (~I0) & s)|(s & I1);
endmodule



