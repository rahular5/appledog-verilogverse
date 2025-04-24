# Question was to generate two clks with 50% duty cycle and the clk2 is delayed version of clk1
<img width="1438" alt="Screenshot 2025-04-24 at 6 59 24 AM" src="https://github.com/user-attachments/assets/67c3fda5-ee44-4332-b5c7-605e5141d390" />

always #5 clk1 = ~clk1; 

always @(clk1)
 #5 clk2 = clk1; 
