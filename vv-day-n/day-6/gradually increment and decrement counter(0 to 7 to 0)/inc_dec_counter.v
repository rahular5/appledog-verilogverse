module counter(clk,rst,count);
  
  input clk,rst;
  output [2:0]count;
  reg [2:0] temp;
  reg ctrl;
  
  assign count = temp;

  
  always@(posedge clk) begin
    if(rst) begin
      temp<=3'b000;
      ctrl<=1;
    end
    else
      if (ctrl) begin
        if (temp==3'b111) begin
          ctrl<=0;
          temp=temp-1;
        end
        else begin
          temp=temp+1;
        end
      end
    
    
    else
      if(temp==3'b000) begin
          ctrl<=1;
          temp<=temp+1;
        end
        else
          temp<=temp-1;
  end
endmodule
