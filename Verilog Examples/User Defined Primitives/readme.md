## AND Operation using User Defined Primitives
```
primitive my_and (Y, A, B);
input A, B;
output Y;

table
  0 ? : 0;
  ? 0 : 0;
  1 1 : 1;
endtable

endprimitive
```

## OR Operation using User Defined Primitives
```
primitive my_or(Y, A, B);
input A, B;
output Y;

table
  0 0 : 0;
  1 ? : 1;
  ? 1 : 1;
endtable

endprimitive
```
## NAND Operation using User Defined Primitives
```
primitive my_nand (Y, A, B);
input A, B;
output Y;

table
  0 0 : 1;
  0 1 : 1;
  1 0 : 1;
  1 1 : 0;
endtable

endprimitive
```
## NOR Operation using User Defined Primitives
```
primitive my_nand (Y, A, B);
input A, B;
output Y;

table
  0 0 : 1;
  0 1 : 0;
  1 0 : 0;
  1 1 : 0;
endtable

endprimitive
```
## XOR Operation using User Defined Primitives
```
primitive my_nand (Y, A, B);
input A, B;
output Y;

table
  0 0 : 0;
  0 1 : 1;
  1 0 : 1;
  1 1 : 0;
endtable

endprimitive
```
## XNOR Operation using User Defined Primitives
```
primitive my_nand (Y, A, B);
input A, B;
output Y;

table
  0 0 : 1;
  0 1 : 0;
  1 0 : 0;
  1 1 : 1;
endtable

endprimitive
```
## Testbench
```
module primtive_tb;
  reg A, B;
  wire Y;
  
  my_nand and1 (Y, A, B); //note : use the user defined primitive name
  
  initial begin
    $monitor("A:%0b | B:%0b | Y:%0b", A, B, Y);
    A = 0;  B = 0; #10;
    A = 0;  B = 1; #10;
    A = 1;  B = 0; #10;
    A = 1;  B = 1; #10;
  end
  
endmodule
```
