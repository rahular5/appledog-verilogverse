
module half_adder(a,b,sum,cout);
  
  input a, b;
  output sum, cout;
  
  assign sum = a ^ b;
  assign cout = a & b;
  
endmodule
  

module full_adder(a,b,cin,sum,cout);
  
  input a, b, cin;
  output sum, cout;
  wire w1, w2, w3;
  
  half_adder h1(a, b, w1, w2);
  half_adder h2(w1, cin, sum, w3);
  
  assign cout = (w2 | w3);
  
endmodule
  
