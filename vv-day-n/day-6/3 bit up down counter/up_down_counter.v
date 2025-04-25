// Verilog code for 3 bit up down counter

module up_down_counter(clk,rst,count,ctrl);
  
  input clk;
  input rst;
  input ctrl;
  output reg [2:0] count;
  reg [2:0] temp;

  always @(posedge clk) begin
    if (rst)
      temp <= 2'b000;
    else begin
      if (ctrl)
        temp <= temp + 1;
      else
        temp <= temp - 1;
    end
  end
    
  assign count = temp;

endmodule
