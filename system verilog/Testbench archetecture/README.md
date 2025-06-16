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
> ### DUT
>```
>module FA(input A, B, Cin, output S, Cout);
>  assign {Cout, S} = A + B + Cin;
>endmodule
>```
> ### Interface
> ```
> interface fa_intf;
>  logic A, B, Cin, S, Cout;
>endinterface
> ```
> ### Transaction
> ```
> class transaction;
>  rand bit A, B, Cin;     
>  bit S, Cout;             
>
>  function void display(string name);
>    $display("[%s] : A=%b B=%b Cin=%b => Sum=%b Cout=%b", name, A, B, Cin, S, Cout);
>  endfunction
>endclass
> ```
> ### Generator
> ```
> class generator;
>  rand transaction tr;
>  mailbox gen2driv;
>  
>  function new(mailbox gen2driv);
>    this.gen2driv = gen2driv;
>  endfunction
>  
>  task main();
>    repeat(10) begin
>      tr = new();
>      assert(tr.randomize());
>      gen2driv.put(tr);
>      tr.display("GEN");
>    end
>  endtask
>endclass
> ```
> ### Driver
> ```
> class driver;
>  transaction tr;
>  mailbox gen2driv;
>  virtual fa_intf vif;
>  
>  function new(mailbox gen2driv, virtual fa_intf vif);
>    this.gen2driv = gen2driv;
>    this.vif = vif;
>  endfunction
>  
>  task main();
>    repeat(10) begin
>      gen2driv.get(tr);
>      vif.A <= tr.A;
>      vif.B <= tr.B;
>      vif.Cin <= tr.Cin;
>      #1;//
>      tr.display("DRV");
>      #2;
>    end
>  endtask
>endclass
> ```
> ### Monitor
> ```
> class monitor;
>  transaction tr;
>  mailbox mon2scb;
>  virtual fa_intf vif;
>  
>  function new(mailbox mon2scb, virtual fa_intf vif); 
>    this.mon2scb = mon2scb;
>    this.vif = vif;
>  endfunction
>  
>  task main();
>    repeat(10) begin
>      #2;
>      tr = new();
>      tr.A = vif.A;
>      tr.B = vif.B;
>      tr.Cin = vif.Cin;
>      tr.S = vif.S;
>      tr.Cout = vif.Cout;
>      mon2scb.put(tr);
>      
>      tr.display("MON");
>    end
>  endtask
>endclass
> ```
> ### Scoreboard
> ```
> class scoreboard;
>  transaction tr;
>  mailbox mon2scb;
>  
>  function new(mailbox mon2scb);
>    this.mon2scb = mon2scb;
>  endfunction
>  
>  task main();
>    repeat(10)
>      begin
>        mon2scb.get(tr);
>        
>        if({tr.Cout, tr.S} == tr.A + tr.B + tr.Cin)
>          $display("TEST PASSED");
>        else
>          $error("TEST FAIL");
>        
>        tr.display("SCB");
>      end
>  endtask
>endclass
> ```



