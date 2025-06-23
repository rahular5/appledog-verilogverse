```
module tb;
  bit [7:0] array1[10], array2[10];
  initial begin
    for(int i = 0; i<$size(array1) ; i++)
      array1[i]=0;
    
    foreach (array2[k])
      $display("array2[%0d] = %0d",k,array2[k]);
    
    foreach (array2[j])
      array2[j]=$random;
    
    foreach (array2[k])
      $display("array2[%0d] = %0d",k,array2[k]);
  end
endmodule
 ```   
```
module tb;
  bit [7:0] array1[15][10];
  initial begin
    foreach (array1[i,j])
      begin
        array1[i][j] = $random;
        $display("The array1[%0d][%0d] = %0d",i,j,array1[i][j]);
      end
  end
endmodule

//The Dyanamic Array is '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} 
// The Dyanamic Array is '{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14} 
// The Dyanamic Array without deleting the elements '{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} 
// The Dyanamic Array Resizing and deleting  '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} 
// The  deleted Dyanamic Array is '{}
```
