// Design of mod-10 counter

module async_low_rst_counter(clk,rst,count);
  
  input clk;
  input rst;         
  output reg [3:0] count;
  reg [3:0] temp;

  always @(posedge clk) begin
    if (rst)
      temp <= 4'b0000;
    else begin
      if (temp == 4'b1010)
        temp <= 4'b0000;
      else
        temp <= temp + 1;
    end
  end
    
  assign count = temp;

endmodule
