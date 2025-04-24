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

![image](https://github.com/user-attachments/assets/1817fae9-5233-4289-b229-f0ed65f2392c)


![image](https://github.com/user-attachments/assets/cfb91a18-e591-4678-9080-bf2e4d7d045e)
