# 2x1 mux using ternary operator

<p align="center">
  <img src="https://github.com/user-attachments/assets/14ed5124-6d51-4ee8-b544-7d297f085530" width="500"/>
</p>
<p align="center">
  <code>assign Y = (S == 1'b0) ? I[0] : I[1];</code>
</p>


# 4x1 mux using ternary operator
<p align="center">
  <img src="https://github.com/user-attachments/assets/04dcce77-1d43-4435-8c48-1e18e6bcadd1" width="500"/>
</p>

<p align="center">
  <code>assign Y = (S == 2'b00) ? I[0] : (S == 2'b01) ? I[1] : (S == 2'b10) ? I[2] : I[3];</code>
</p>


