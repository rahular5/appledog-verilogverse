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
------------------
### Methods
```
module tb;
  int a[$];
  int y;
  
  initial begin
    
    a = {1,2,3,4};
    $display("Original array is %p",a);
    
    y = a.pop_front();
    $display("Element %0d is poped from front in the array %p",y,a);
    
    
    y = a.pop_back();
    $display("Element %0d is poped from back in the array %p",y,a);
    
    a.push_front(9);
    $display("9 is pushed in front of the array %p",a);
    
    a.push_back(8);
    $display("8 is pushed in back of the array %p",a);
    
  end
endmodule
  ```
#### Output
```
Original array is '{1, 2, 3, 4} 
Element 1 is poped from front in the array '{2, 3, 4} 
Element 4 is poped from back in the array '{2, 3} 
9 is pushed in front of the array '{9, 2, 3} 
8 is pushed in back of the array '{9, 2, 3, 8}
```
#### without those how to perform all those functions without keyword
```

    
