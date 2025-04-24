# Generate 2 clock each of 10ns time period and 50 percent duty. Clk2 is delayed version of clock 1 by 5 ns.
<img width="1438" alt="Screenshot 2025-04-24 at 6 59 24 AM" src="https://github.com/user-attachments/assets/67c3fda5-ee44-4332-b5c7-605e5141d390" />

always #5 clk1 = ~clk1; 

always @(clk1)

 #5 clk2 = clk1; 
