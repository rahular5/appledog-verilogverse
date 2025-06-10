#     rand_mode( );

> ### if randomization is to be controlled for all properties of class
>
> ### SYNTAX : handle_name.rand_mode(0/1);
>
> ### if randomization is to be specific properties of class
>
 ### SYNTAX : handle_name.proerty_name.rand_mode(0/1);

```
class packet;
  rand bit[7:0] a;
  rand byte b;
  
  constraint c1 { a > 25 ; a <= 155 ;}
  constraint c2 { b >= 10 ; b <= 100 ;}
  
endclass

module test;
  packet p;
  initial begin
    p = new();
    $display("Before doing anything");
    repeat(2)
      begin
        assert(p.randomize());
        $display("A = %0d  B = %0d ",p.a,p.b);
      end
    
    p.rand_mode(0);
    
    $display("disabling randomiization for all variables");
    repeat(2)
      begin
        assert(p.randomize());
        $display("A = %0d  B = %0d ",p.a,p.b);
      end
  end
endmodule
```

## Output

```
Before doing anything
A = 53  B = 95 
A = 57  B = 12 
disabling randomiization for all variables
A = 57  B = 12 
A = 57  B = 12
```
#     constraint_mode( );

> ### if randomization is to be controlled for all constraints of class
>
 ### SYNTAX : handle_name.constraint_mode(0/1);
>
> ### if randomization is to be specific constraints of class ie. all constraints
>
 ### SYNTAX : handle_name.constraint_name.rand_mode(0/1);

```
class packet;
  rand bit[7:0] a;
  rand byte b;
  
  constraint c1 { a > 25 ; a <= 155 ;}
  constraint c2 { b >= 10 ; b <= 100 ;}
  
endclass

module test;
  packet p;
  initial begin
    p = new();
    $display("Before doing anything");
    repeat(2)
      begin
        assert(p.randomize());
        $display("A = %0d  B = %0d ",p.a,p.b);
      end
    
    p.c1.constraint_mode(0);
    
    $display("disabling randomiization for all variables");
    repeat(2)
      begin
        assert(p.randomize());
        $display("A = %0d  B = %0d ",p.a,p.b);
      end
  end
endmodule
```
## Output

```
Before doing anything
A = 53  B = 95 
A = 57  B = 12 
disabling randomiization for all variables
A = 96  B = 75 
A = 204  B = 54
```

# User defined callbacks.

 ## pre_randomize( );
> 
> SYNTAX:
> 
> function void pre_randomize( );
> 
>    ...
> 
>    before randomization executes
> 
>    ...
> 
>  endfunction

  ## post_randomize( );
> 
> SYNTAX:
> 
> function void post_randomize( );
> 
>    ...
> 
>    after randomization executes
> 
>    ...
> 
>  endfunction
>
```
class packet;
  
  rand bit[7:0] a;
  rand byte b;
  
  constraint c1 { a > 25 ; a <= 155 ;}
  constraint c2 { b >= 10 ; b <= 100 ;}
  
  function void pre_randomize();
    $display("HII IM IN pre_randomize FUNCTION");
  endfunction
  
  function void post_randomize();
    $display("HII IM IN post_randomize FUNCTION");
    $display("A = %0d  B = %0d ",a,b);
  endfunction
  
endclass

module test;
  packet p;
  initial begin
    p = new();
    $display("Before doing anything");
    repeat(2)
      begin
        assert(p.randomize());
      end
    $display("After randomization");
  end
endmodule
```

## Output

```
Before randomization
HII IM IN pre_randomize FUNCTION
HII IM IN post_randomize FUNCTION
A = 53  B = 95 
HII IM IN pre_randomize FUNCTION
HII IM IN post_randomize FUNCTION
A = 57  B = 12 
After randomization
```
#   solve before constraint

 ## SYNTAX : constraint c1 { a < b ; solve a before b ; }

#   constraint Inheritance

```
class parent;
  rand int a;
  constraint c1 { a  > 100 ; a < 200 ; }
endclass

class child extends parent;
  constraint c2 { a > 150 ; a < 190 ;}
endclass

module test;
  child c;
  initial begin
    c = new();
    repeat(5) begin
      assert(c.randomize());
      $display("A = %0d ",c.a);
    end
  end
endmodule
```

## Output 

```
A = 171 
A = 153 
A = 160 
A = 152 
A = 153
```

> ### Here we can see only child c constraints are acting because of the inheritance that the child is inheriting the property of the parent and overwriting the constraints

# Implication constraint ( ->  <-> )

```
class packet;
  rand bit[7:0] data;
  rand bit low, high;
  
  constraint c1 { (low) -> data < 100 ; }
  constraint c2 { (high) -> data > 100 ; }
  constraint c3 { low != high ; }
  
endclass

module test;
  packet p;
  initial begin
    p = new();
    $display("Before doing anything");
    repeat(5)
      begin
        assert(p.randomize());
        $display("DATA = %0d , low = %0b , high = %0b ",p.data,p.low,p.high);
      end
  end
 
endmodule
```

## Output 

```
Before doing anything
DATA = 11 , low = 1 , high = 0 
DATA = 185 , low = 0 , high = 1 
DATA = 32 , low = 1 , high = 0 
DATA = 232 , low = 0 , high = 1 
DATA = 137 , low = 0 , high = 1
```

> #### we can have foreach loop in constraint
> #### we can have if else
> #### and we can have function inside constraint
> #### { var == fun_name ; }

# foreach constraints 

## SYNTAX : constraint c {foreach (arr[i]) ;}

> ### Question 1) write a constraint to randomize the value of 1D array in between 0 to 100 range
>
```
class packet;
  rand int arr[];
  constraint c1 {foreach(arr[i]) arr[i] inside {[0:100]}; }
endclass

module test;
  packet p;
  initial begin
    p = new();
    repeat(5) begin
      assert(p.randomize());
      $display("A = %0p ",p.arr);
    end
  end
endmodule
```

## Output
``` DATA = 11 , low = 1 , high = 0 
DATA = 185 , low = 0 , high = 1 
DATA = 32 , low = 1 , high = 0 
DATA = 232 , low = 0 , high = 1 
DATA = 137 , low = 0 , high = 1
```

> ### Question 2) write a constraint to
>     a) randomize a dynamic array size inbetween 10 to 15
>     b) on each location it should generate the unique even number
>     c) the array must be sorted in acending order
>```
>class packet;
> rand int arr[];
>  constraint c1 {foreach(arr[i]) arr[i] inside {[0:100]}; }
>  constraint c2 {arr.size >= 10 ; arr.size <= 15;}
>  constraint c3 {foreach (arr[i]) arr[i]%2==0;}
>  constraint c4 {foreach(arr[i]) if (i>=1) arr[i-1] < arr[i];}
>endclass
>
>module test;
>  packet p;
>  initial begin
>    p = new();
>    repeat(5) begin
>      assert(p.randomize());
>      $display("A = %0p ",p.arr);
>    end
>  end
>endmodule
>```

## Output

```
A = '{6, 8, 12, 14, 20, 42, 44, 46, 48, 74, 80}  
A = '{0, 4, 40, 58, 60, 66, 70, 80, 82, 86, 88}  
A = '{2, 4, 8, 10, 24, 28, 32, 36, 40, 56, 74, 90, 100}  
A = '{0, 2, 4, 10, 14, 16, 20, 22, 24, 26, 28, 30, 50, 56}  
A = '{16, 30, 32, 36, 68, 74, 78, 82, 84, 90, 98}
```


>### Question 3) write a constrainit to randomize size of dynamic array and to generate even values on odd position and odd values of even position and odd values of even position in 0 to 100
> ```
>class packet;
>  rand int arr[];
>  constraint c1 {arr.size >= 10 ; arr.size <= 15;}
>  constraint c2 {foreach(arr[i]) arr[i] inside {[0:100]}; }
>  constraint c3 {foreach(arr[i]) if(i>1) arr[i-1] < arr[i];}
> 
>  constraint c4 {
>    foreach(arr[i])
>      if(i%2 == 0)
>        arr[i]%2 != 0;
>    else
>      arr[i]%2 == 0;
>  }
> 
>endclass
>
>module test;
>  packet p;
>  initial begin
>    p = new();
>    repeat(5) begin
>      assert(p.randomize());
>      $display("A = %0p ",p.arr);
>    end
>  end
>endmodule
>```

>### Question 4) write a constraint to make sequence 0 1 0 2 0 3 0 4 0 5 0 6 0 7
>```
>class packet;
>  rand int arr[];
>  constraint c1 {arr.size inside {[10:15]};}
>  constraint c2 {foreach(arr[i])
>    if (i % 2 == 0 )
>      arr[i] == 0;
>    else 
>      arr[i] == (i+1) / 2 ;   
>  }
>  
>endclass
>
>module test;
>  packet p;
>  initial begin
>    p = new();
>      assert(p.randomize());
>      $display("A = %0p ",p.arr);
>  end
>endmodule
>```

>### Question 5) declare a constraint to randomize the array of real numbers in between the range 1.000 to 1.999
>```
>class packet;
>  rand int arr[];
>  
>  constraint c1 {arr.size inside {[10:15]};}
>  constraint c2 {foreach (arr[i])  arr[i] inside {[1000:1999]};}
>  
>
>   function void post_randomize();
>    real arr2[$];
>    arr.sort();
>    foreach(arr[i])
>      arr2[i]= real'(arr[i])/1000;
>    foreach(arr2[i])
>      $display("Arr= %f", arr2[i]);
>   endfunction
>  
>endclass
>
>module test;
>  packet p;
>  initial begin
>    p = new();
>    assert(p.randomize());
>  end
>```endmodule
>
> ```## Output
>Arr= 1.039000
>Arr= 1.039000
>Arr= 1.109000
>Arr= 1.130000
>Arr= 1.165000
>Arr= 1.206000
>Arr= 1.546000
>Arr= 1.550000
>Arr= 1.733000
>Arr= 1.939000
>Arr= 1.981000
>```
