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
  module tb;
    int q[$]  = '{5, 7, 9, 11, 2};
    
    initial begin
    
    q = {q,6}; // q.push_back(6);
    $display("array is %p",q);
    
    q = {3,q}; // q.push_front(3);
    $display("array is %p",q);
    
    q = q[1:$]; // void'(q.pop_front(1));
    $display("array is %p",q);
    
    q = q[0:$-1]; // void'(q.pop_back(1));
    $display("array is %p",q);
    
    q = {q[0:3],9,q[4:$]}; // q.insert(4,9);
    $display("array is %p",q);
      
    q = q[2:$]; // queue lacking the first two items
    $display("array is %p",q);
    
    q = q[1:$-1]; // queue lacking the first and last items
    $display("array is %p",q);
    
    q = {}; // q.delete();
    $display("array is %p",q);    
      
    end
  endmodule
```
### Output
```
array is '{5, 7, 9, 11, 2, 6} 
array is '{3, 5, 7, 9, 11, 2, 6} 
array is '{5, 7, 9, 11, 2, 6} 
array is '{5, 7, 9, 11, 2} 
array is '{5, 7, 9, 11, 9, 2} 
array is '{9, 11, 9, 2} 
array is '{11, 9} 
array is '{}
```
### Array query functions
  * $left
  * $right
  * $increment
  * $high
  * $low
  * $size
  * $dimensions
  * $unpacked_dimensions
    
    
