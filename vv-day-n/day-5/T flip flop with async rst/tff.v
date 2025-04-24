// Verilog code for  positive edge triggered tff with asynchronous reset.

module tff(clk,rst,T,Q);
  input clk,rst,T;
  output reg Q;
  reg temp;
  
  always @ (posedge clk or posedge rst) begin
    if (rst)
        temp <= 0;
      else
        if (T)
          temp <= ~temp;
      else
        temp <= temp;
    Q <= temp;
  end
endmodule
