module mux4x1_ter_operator (I, S, Y);
  
  input [3:0] I;
  input [2:0] S;
  output Y;
  
  assign Y = (S == 2'b00) ? I[0] :
    		 (S == 2'b01) ? I[1] :
   			 (S == 2'b10) ? I[2] :I[3];
    
  
endmodule
