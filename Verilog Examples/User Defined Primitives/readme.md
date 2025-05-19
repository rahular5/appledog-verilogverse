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
## Output (Truth Table for OR Gate)
```
A:0 | B:0 | Y:0
A:0 | B:1 | Y:0
A:1 | B:0 | Y:0
A:1 | B:1 | Y:1
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
## Output (Truth Table for OR Gate)
```
A:0 | B:0 | Y:0
A:0 | B:1 | Y:1
A:1 | B:0 | Y:1
A:1 | B:1 | Y:1
```
