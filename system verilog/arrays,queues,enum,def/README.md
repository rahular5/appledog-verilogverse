# Queues

### Declaration:
  - ```
    int q1[$]; //Unbounded queue
    int q2[$:100]; // Bounded queue max size 101
    ```
-------------------
### Operators 
  - size(); // returns number of elements in the queue
  - insert(index,item); // Method to insert item at given index example (2,5)
```    
    module tb;
  int a[$];
  
  initial begin
    $display("%d",a.size());
    
    a = {1,2,3,4};
    $display("%d",a.size());
    
    a.insert(2,10);
    $display("%p",a);
    
    a.delete(3);
    $display("%d",a.size());
    
    a.delete();
    $display("%d",a.size());
  end
endmodule
```  
    
