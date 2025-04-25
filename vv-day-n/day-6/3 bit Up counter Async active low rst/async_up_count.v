// 3 bit Up counter with Asynchronous active low reset
module async_low_rst_counter(clk,rst,count);
  input clk;
  input rst;         
  output reg [2:0] count;
  reg [2:0] temp;

  always @(posedge clk) begin
    if (!rst)
      temp <= 3'b000;
    else
      temp <= temp + 1;
  end
  assign count = temp;

endmodule
