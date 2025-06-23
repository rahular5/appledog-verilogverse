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
