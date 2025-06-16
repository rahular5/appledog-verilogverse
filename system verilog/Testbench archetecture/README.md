# Interface
> #### use always logic type in the interface.
> - interface is used to encapsulate communicatiuon between design blocks and between design and verification blocks.
> - Encapsulating communicatiuon between block facilities design reuse.
> - interface can be accesed therough ports as single item.
> - signals can be added to and remove easilly from an interface without modifying any port list.
> - interface can contain the connectivity, synchronixzation and optionally between two or more blocks.
> 

> ## Simple example for interface (half adder)
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
# CASE STUDY
> ## (1) Design and implementation of full adder and verification  of full adder and verification using system verilog.
> <img width="490" alt="Screenshot 2025-06-16 at 5 33 29 PM" src="https://github.com/user-attachments/assets/3b09c5b8-1138-498c-871a-57ea323eb951" />
>

