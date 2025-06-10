#     rand_mode( );

> ### if randomization is to be controlled for all properties of class
>
> ### SYNTAX : handle_name.rand_mode(0/1);
>
> ### if randomization is to be specific properties of class
>
> ### SYNTAX : handle_name.proerty_name.rand_mode(0/1);

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
> ### SYNTAX : handle_name.constraint_mode(0/1);
>
> ### if randomization is to be specific constraints of class ie. all constraints
>
> ### SYNTAX : handle_name.constraint_name.rand_mode(0/1);

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
