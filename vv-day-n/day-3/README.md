# 2x1 multiplexer using ternanry operator
<p align="center">
module mux2x1_ter_operator (I, S, Y);
  
  input [1:0] I;
  input S;
  output Y;
  
  assign Y = (S == 1'b0) ? I[0] : I[1];
  
endmodule
<p/>
<p align="center">
<img width="479" alt="Screenshot 2025-04-17 at 6 51 50 PM" src="https://github.com/user-attachments/assets/14ed5124-6d51-4ee8-b544-7d297f085530" />
<p/>
