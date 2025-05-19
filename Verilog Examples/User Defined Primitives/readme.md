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

