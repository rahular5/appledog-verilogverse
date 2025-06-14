# Classes
>
>Defination : it is the user defined datatype of sv.
>
> groups the heterogenous data.
>  1. Properties of class : all signal Declarations.
>  2. Methods of class : functions and tasks inside class
>
> class is bydefault automatic.
>         -  New Memory for new instance
>         -  use new();
>hence memory is allocated with the help of "new"
>New memory set for each instance

>## HOW TO DECLARE CLASS:
>we cant write module inside class or class inside module
> ### Example
> ```
> class packet;
>  bit [7:0] adress;
>  bit [7:0] data;
>  
>  function void display();
>    $display("adress : %0b and data : %0b",adress,data);
>  endfunction
>  
>endclass
>
>module test;
>  packet p;
>  
>  initial begin
>    p = new();
>    p.display();
>    p.adress = 100;
>    p.data = 200;
>    p.display();
>  end
>endmodule
>```
> ## Output
> ```
> adress : 0 and data : 0
> adress : 1100100 and data : 11001000
> ```
>
> [NOTE] without allocating the memory the method or class give the error that you are trying to acess null object
>
> ### Object and Handle : object is the memory and handle is the pointer to memory

>## QUESTION] Write a sv programme to chek wether the object is created or not
>```
>class packet;
>  bit [7:0] adress;
>  bit [7:0] data;
>  
>  function void display();
>    $display("adress : %0b and data : %0b",adress,data);
>  endfunction
>  
>endclass
>endmodule
>
>module test;
>  packet p;
>  
>  initial begin
>    
>    //p = new();
>    
>    if (p == null)
>      $display("---Object is not created---");
>    else
>      p.display();
>  end
>```
>### output
>```
>---Object is not created---
>```

> ## Class with static properties and static Methods.
>
> 1) write a static keyword before datatype and before function.
> 2) Memory is allocated at the time of declaration ( without creating object we can acess memory )
> 3) the memory name is always a class name.
>
>```
> class packet;
>  static int addr;
>  static int data ;
>  static function void display();
>    $display("addr=%0d data=%0d",addr,data);
>  endfunction
>endclass
>
>module test;
>  packet p1,p2;
>  initial begin
>    p1.display();
>    p2.display();
>    p1.addr = 100;
>    p2.data = 200;
>    p1.display();
>    p2.display();
>  end
>endmodule
>```
>### output
> ```
> addr=0 data=0
>addr=0 data=0
>addr=100 data=200
>addr=100 data=200
> // here we can see that p1 handle and p2 both handle are pointing toowards
> the same memory and memory name is the name of the class that is packet
> ```

  



