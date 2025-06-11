# Classes
> [!NOTE]
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


>


