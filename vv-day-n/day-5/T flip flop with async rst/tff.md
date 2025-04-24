# waveform for T flip flop with asynchronous reset
<img width="1429" alt="Screenshot 2025-04-24 at 7 48 41 AM" src="https://github.com/user-attachments/assets/0c96a316-b596-44d5-9d61-f5c0e5a2d557" />

    #3  rst = 0;   // Deassert reset before first clock edge

    #7  T = 1;     // At 10 ns rising edge → Q toggles
    #10 T = 0;     // At 20 ns → Q holds
    #10 T = 1;     // At 30 ns → Q toggles

    #6  rst = 1;   // Assert async reset (before clk edge)
    #4  rst = 0;   // Deassert reset (at 40 ns)

    #6  T = 1;     // At 45 ns rising edge → Q toggles
    #10 T = 0;     // At 55 ns → Q holds
