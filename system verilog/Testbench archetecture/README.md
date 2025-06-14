# Interface

> simple example for interface (half adder)
> ```
> interface intf;
>  logic a,b,c,s;
>  modport DUT (input a,b, output c,s);
>  modport TEST (input c,s, output a,b);
>endinterface
> ```
>```
>module HA (intf inf);
>  always_comb
>  {inf.c,inf.s} = inf.a + inf.b;
>endmodule
>```
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
>```
>module top;
>  intf inf();
>  HA dut (inf);
>  test tb (inf);
>endmodule
>```
  
