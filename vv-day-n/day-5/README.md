# generate a clock of 20 ns time period with 40 percent duty cycle
![image](https://github.com/user-attachments/assets/43a38277-3eaa-4249-a000-abcca583ad11)
  
    always begin
      #8 clk = 1;
      #12 clk = 0;
    end

# generate a clock for 200 mhz frequency
<img width="1435" alt="Screenshot 2025-04-24 at 8 12 28 AM" src="https://github.com/user-attachments/assets/ec20ceac-72ff-4ac6-9a97-5c1986dae0f2" />

    #2.5 clk =~clk;

# Generate 2 clock each of 10ns time period and 50 percent duty. Clk2 is delayed version of clock 1 by 5 ns.
<img width="1438" alt="Screenshot 2025-04-24 at 6 59 24 AM" src="https://github.com/user-attachments/assets/67c3fda5-ee44-4332-b5c7-605e5141d390" />

    always #5 clk1 = ~clk1; 

    always @(clk1)

    #5 clk2 = clk1; 
