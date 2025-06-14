# Interface
> #### use always logic type in the interface.
> - interface is used to encapsulate communicatiuon between design blocks and between design and verification blocks
> 

> Simple example for interface (half adder)
> ### interface block
> ```
> interface intf;
>  logic a,b,c,s;
>  modport DUT (input a,b, output c,s);
>  modport TEST (input c,s, output a,b);
>endinterface
> ```
> ### Design block
>```
>module HA (intf inf);
>  always_comb
>  {inf.c,inf.s} = inf.a + inf.b;
>endmodule
>```
>### Test block
>```
>module test(intf inf);
>  initial begin
>    repeat(10) begin
>      {inf.a,inf.b}=$random;
>      #5;
>    end
>  end
>    initial begin
>      $monitor("a=%0b b=%0b c=%0b s=%0b",inf.a,inf.b,inf.c,inf.s);
>    end
>endmodule
>```
>### Top module
>```
>module top;
>  intf inf();
>  HA dut (inf);
>  test tb (inf);
>endmodule
>```
  
